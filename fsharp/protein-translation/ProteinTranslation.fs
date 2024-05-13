module ProteinTranslation

open FsToolkit.ErrorHandling

type private Nucleobase =
    | A
    | U
    | C
    | G

type private AminoAcid =
    | Methionine
    | Phenylalanine
    | Leucine
    | Serine
    | Tyrosine
    | Cysteine
    | Tryptophan

type private RNA = RNA of Nucleobase list

type private Triplet = Triplet of Nucleobase * Nucleobase * Nucleobase

type private Codon =
    | Coding of AminoAcid
    | Stop

type private Protein = Protein of AminoAcid list

let private nucleobaseDictionary =
    [| 'A', A; 'U', U; 'C', C; 'G', G |] |> Map.ofArray

let private toBase (letter: char) : Result<Nucleobase, string> =
    nucleobaseDictionary
    |> Map.tryFind letter
    |> Result.requireSome $"Invalid nucleobase: {letter}"

let private toTriplet: Nucleobase list -> Result<Triplet, string> =
    function
    | [ a; b; c ] -> Ok(Triplet(a, b, c))
    | notTriplet -> Error $"Invalid triplet length: {List.length notTriplet}"

let private toCodon (Triplet(a, b, c): Triplet) : Result<Codon, string> =
    match (a, b, c) with
    | A, U, G -> Methionine |> Coding |> Ok
    | U, U, (U | C) -> Phenylalanine |> Coding |> Ok
    | U, U, (A | G) -> Leucine |> Coding |> Ok
    | U, C, _ -> Serine |> Coding |> Ok
    | U, A, (U | C) -> Tyrosine |> Coding |> Ok
    | U, G, (U | C) -> Cysteine |> Coding |> Ok
    | U, G, G -> Tryptophan |> Coding |> Ok
    | U, A, (A | G) -> Stop |> Ok
    | U, G, A -> Stop |> Ok
    | notCodon -> Error $"Invalid codon: {notCodon}"

let private resultExpressionProtein (strand: string) : Result<Protein, string> =
    result {
        let! (rna: RNA) = strand |> List.ofSeq |> List.traverseResultM toBase |> Result.map RNA

        let! (codons: Codon list) =
            match rna with
            | RNA bases ->
                bases
                |> List.chunkBySize 3
                |> List.traverseResultM toTriplet
                |> Result.bind (List.traverseResultM toCodon)

        let (protein: Protein) =
            codons
            |> List.takeWhile (function
                | Stop -> false
                | _ -> true)
            |> List.map (function
                | Coding aminoAcid -> aminoAcid
                | Stop -> failwith "Incomplete pattern match warning")
            |> Protein

        return protein
    }

let proteins (rna: string) : string list =
    resultExpressionProtein rna
    |> Result.either (fun (Protein aminoacids) -> List.map (sprintf "%A") aminoacids) List.singleton
