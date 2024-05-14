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

let private nucleobaseDictionary: Map<char, Nucleobase> =
    [| 'A', A; 'U', U; 'C', C; 'G', G |] |> Map.ofArray

let private toBase (letter: char) : Result<Nucleobase, string> =
    nucleobaseDictionary
    |> Map.tryFind letter
    |> Result.requireSome $"Invalid nucleobase: {letter}"

let private toTriplet: Nucleobase list -> Result<Triplet, string> =
    function
    | [ first; second; third ] -> Triplet(first, second, third) |> Ok
    | notTriplet -> Error $"Invalid triplet length: {List.length notTriplet}"

let private toCodon (Triplet(first, second, third)) : Result<Codon, string> =
    let resultCodon = Some >> Codon >> Ok
    match (first, second, third) with
    | A, U, G       -> Methionine |> resultCodon
    | U, U, (U | C) -> Phenylalanine |> resultCodon
    | U, U, (A | G) -> Leucine |> resultCodon
    | U, C, _       -> Serine |> resultCodon
    | U, A, (U | C) -> Tyrosine |> resultCodon
    | U, G, (U | C) -> Cysteine |> resultCodon
    | U, G, G       -> Tryptophan |> resultCodon
    | U, A, (A | G)
    | U, G, A       -> None |> Codon |> Ok
    | notCodon -> Error $"Invalid codon: {notCodon}"

let private toAminoAcids: Codon list -> AminoAcid list =
    List.takeWhile (function Codon aa -> Option.isSome aa)
    >> List.choose (function Codon aa -> if Option.isSome aa then aa else None)

let private resultExpressionProtein (strand: string) : Result<Protein, string> =
    result {
        let! rna = strand |> List.ofSeq |> List.traverseResultM toBase
        let! triplets = rna |> List.chunkBySize 3 |> List.traverseResultM toTriplet
        let! codons = triplets |> List.traverseResultM toCodon
        return codons |> toAminoAcids |> Protein
    }

let proteins (rna: string) : string list =
    resultExpressionProtein rna
    |> Result.either (function Protein aa -> List.map (sprintf "%A") aa) List.singleton
