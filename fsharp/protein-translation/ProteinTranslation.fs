module ProteinTranslation

open FsToolkit.ErrorHandling

type Nucleobase =
    | A
    | U
    | C
    | G

type RNA = Nucleobase list

type Triplet = Nucleobase * Nucleobase * Nucleobase

type AminoAcid =
    | Methionine
    | Phenylalanine
    | Leucine
    | Serine
    | Tyrosine
    | Cysteine
    | Tryptophan

type Protein = AminoAcid list

type Codon =
    | Coding of AminoAcid
    | Stop

let private toBase: char -> Result<Nucleobase, string> =
    function
    | 'A' -> Ok A
    | 'U' -> Ok U
    | 'C' -> Ok C
    | 'G' -> Ok G
    | notNucleobase -> Error $"invalid nucleobase: {notNucleobase}"

let private toTriplet: Nucleobase list -> Result<Triplet, string> =
    function
    | [ a; b; c ] -> Ok(a, b, c)
    | notTriplet -> Error $"invalid triplet length: {List.length notTriplet}"

let private toCodon: Triplet -> Result<Codon, string> =
    function
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

let private toProtein (codons: Codon list) : Protein =
    let rec loop acc coll =
        match coll with
        | [] -> List.rev acc
        | Stop :: _ -> List.rev acc
        | Coding aa :: rest -> loop (aa :: acc) rest

    loop [] codons

let private resultProtein (rna: string) : Result<Protein, string> =
    rna
    |> List.ofSeq
    |> List.traverseResultM toBase
    |> Result.map (List.chunkBySize 3)
    |> Result.bind (List.traverseResultM toTriplet)
    |> Result.bind (List.traverseResultM toCodon)
    |> Result.map toProtein

let proteins (rna: string) : string list =
    match resultProtein rna with
    | Error err -> [ err ]
    | Ok protein -> List.map (sprintf "%A") protein
