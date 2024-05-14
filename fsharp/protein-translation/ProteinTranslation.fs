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

type private Triplet = Triplet of Nucleobase * Nucleobase * Nucleobase

type private Codon = Codon of AminoAcid option

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

let private toCodon (Triplet(a, b, c)) : Result<Codon, string> =
    match (a, b, c) with
    | A, U, G -> Methionine |> Some |> Codon |> Ok
    | U, U, (U | C) -> Phenylalanine |> Some |> Codon |> Ok
    | U, U, (A | G) -> Leucine |> Some |> Codon |> Ok
    | U, C, _ -> Serine |> Some |> Codon |> Ok
    | U, A, (U | C) -> Tyrosine |> Some |> Codon |> Ok
    | U, G, (U | C) -> Cysteine |> Some |> Codon |> Ok
    | U, G, G -> Tryptophan |> Some |> Codon |> Ok
    | U, A, (A | G) -> None |> Codon |> Ok
    | U, G, A -> None |> Codon |> Ok
    | notCodon -> Error $"Invalid codon: {notCodon}"

let private toProtein: Codon list -> Protein =
    List.takeWhile (function Codon aa -> Option.isSome aa)
    >> List.choose (function Codon aa -> if Option.isSome aa then aa else None)
    >> Protein

let private resultExpressionProtein (strand: string) : Result<Protein, string> =
    result {
        let! rna = strand |> List.ofSeq |> List.traverseResultM toBase
        let! triplets = rna |> List.chunkBySize 3 |> List.traverseResultM toTriplet
        let! codons = triplets |> List.traverseResultM toCodon
        return codons |> toProtein
    }

let proteins (rna: string) : string list =
    resultExpressionProtein rna
    |> Result.either (fun (Protein aminoacids) -> List.map (sprintf "%A") aminoacids) List.singleton
