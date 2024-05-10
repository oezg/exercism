module ProteinTranslation

open FsToolkit.ErrorHandling


type Nucleobase =
    | A
    | U
    | C
    | G

type Triplet = Nucleobase * Nucleobase * Nucleobase

type Codon = Nucleobase list

type RNA = Nucleobase list

type AminoAcid =
    | Methionine
    | Phenylalanine
    | Leucine
    | Serine
    | Tyrosine
    | Cysteine
    | Tryptophan

type Protein = AminoAcid list

let private codonToAA: Codon -> Result<AminoAcid option, string> =
    function
    | [ A; U; G ] -> Methionine |> Some |> Ok
    | [ U; U; U ] -> Phenylalanine |> Some |> Ok
    | [ U; U; C ] -> Phenylalanine |> Some |> Ok
    | [ U; U; A ] -> Leucine |> Some |> Ok
    | [ U; U; G ] -> Leucine |> Some |> Ok
    | [ U; C; U ] -> Serine |> Some |> Ok
    | [ U; C; C ] -> Serine |> Some |> Ok
    | [ U; C; A ] -> Serine |> Some |> Ok
    | [ U; C; G ] -> Serine |> Some |> Ok
    | [ U; A; U ] -> Tyrosine |> Some |> Ok
    | [ U; A; C ] -> Tyrosine |> Some |> Ok
    | [ U; G; U ] -> Cysteine |> Some |> Ok
    | [ U; G; C ] -> Cysteine |> Some |> Ok
    | [ U; G; G ] -> Tryptophan |> Some |> Ok
    | [ U; A; A ] -> None |> Ok
    | [ U; A; G ] -> None |> Ok
    | [ U; G; A ] -> None |> Ok
    | _ -> Error "invalid codon"

let private toBase: char -> Result<Nucleobase, string> =
    function
    | 'A' -> Ok A
    | 'U' -> Ok U
    | 'C' -> Ok C
    | 'G' -> Ok G
    | _ -> Error "invalid nucleobase"

let private toProtein (codons: Codon list) : Result<Protein, string> =
    let rec loop acc coll =
        match coll with
        | [] -> Ok(List.rev acc)
        | codon :: rest ->
            match codonToAA codon with
            | Ok(Some aa) -> loop (aa :: acc) rest
            | Ok None -> Ok(List.rev acc)
            | Error err -> Error err

    loop [] codons

let private resultProtein (rna: string) : Result<Protein, string> =
    rna
    |> List.ofSeq
    |> List.traverseResultM toBase
    |> Result.map (List.chunkBySize 3)
    |> Result.bind toProtein

let proteins (rna: string) : string list =
    match resultProtein rna with
    | Error err -> [ err ]
    | Ok protein -> List.map (sprintf "%A") protein
