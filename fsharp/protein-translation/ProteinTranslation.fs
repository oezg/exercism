module ProteinTranslation

open FsToolkit.ErrorHandling

type private Nucleobase =
    | A
    | U
    | C
    | G

type private Triplet = Triplet of Nucleobase * Nucleobase * Nucleobase

type private AminoAcid =
    | Methionine
    | Phenylalanine
    | Leucine
    | Serine
    | Tyrosine
    | Cysteine
    | Tryptophan

type private Protein = Protein of AminoAcid list

type private Codon =
    | Coding of AminoAcid
    | Stop

let private nucleobaseDictionary =
    [| 'A', A; 'U', U; 'C', C; 'G', G |] |> Map.ofArray

let private toBase (letter: char) : Result<Nucleobase, string> =
    nucleobaseDictionary
    |> Map.tryFind letter
    |> Result.requireSome $"invalid nucleobase: {letter}"

let private toTriplet: Nucleobase list -> Result<Triplet, string> =
    function
    | [ a; b; c ] -> Ok(Triplet(a, b, c))
    | notTriplet -> Error $"invalid triplet length: {List.length notTriplet}"

let private toCodon (Triplet(a, b, c): Triplet) : Result<Codon, string> =
    match (a, b, c) with
    | A, U, G -> Ok(Coding Methionine)
    | U, U, (U | C) -> Ok(Coding Phenylalanine)
    | U, U, (A | G) -> Ok(Coding Leucine)
    | U, C, _ -> Ok(Coding Serine)
    | U, A, (U | C) -> Ok(Coding Tyrosine)
    | U, G, (U | C) -> Ok(Coding Cysteine)
    | U, G, G -> Ok(Coding Tryptophan)
    | U, A, (A | G) -> Ok(Stop)
    | U, G, A -> Ok(Stop)
    | notCodon -> Error $"invalid codon: {notCodon}"

let private isCoding codon =
    match codon with
    | Stop -> false
    | _ -> true

let private toProtein (codons: Codon list) : Protein =
    codons |> List.takeWhile isCoding |> List.map (fun (Coding aa) -> aa) |> Protein

let private resultExpressionProtein (strand: string) : Result<Protein, string> =
    result {
        let! rna = strand |> List.ofSeq |> List.traverseResultM toBase
        let! triplets = rna |> List.chunkBySize 3 |> List.traverseResultM toTriplet
        let! codons = triplets |> List.traverseResultM toCodon
        return toProtein codons
    }

let proteins (rna: string) : string list =
    resultExpressionProtein rna
    |> Result.either (fun (Protein aminoacids) -> List.map (sprintf "%A") aminoacids) List.singleton
