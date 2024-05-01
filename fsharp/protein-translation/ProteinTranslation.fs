module ProteinTranslation

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
    | AUG of AminoAcid
    | UUU of AminoAcid
    | UUC of AminoAcid
    | UUA of AminoAcid
    | UUG of AminoAcid
    | UCU of AminoAcid
    | UCC of AminoAcid
    | UCA of AminoAcid
    | UCG of AminoAcid
    | UAU of AminoAcid
    | UAC of AminoAcid
    | UGU of AminoAcid
    | UGC of AminoAcid
    | UGG of AminoAcid
    | UAA
    | UAG
    | UGA

type Nucleobase =
    | A
    | U
    | C
    | G

let private toBase =
    function
    | 'A' -> Ok A
    | 'U' -> Ok U
    | 'C' -> Ok C
    | 'G' -> Ok G
    | _ -> Error "invalid nucleobase"

let private toCodon =
    function
    | [ A; U; G ] -> AUG Methionine |> Ok
    | [ U; U; U ] -> UUU Phenylalanine |> Ok
    | [ U; U; C ] -> UUC Phenylalanine |> Ok
    | [ U; U; A ] -> UUA Leucine |> Ok
    | [ U; U; G ] -> UUG Leucine |> Ok
    | [ U; C; U ] -> UCU Serine |> Ok
    | [ U; C; C ] -> UCC Serine |> Ok
    | [ U; C; A ] -> UCA Serine |> Ok
    | [ U; C; G ] -> UCG Serine |> Ok
    | [ U; A; U ] -> UAU Tyrosine |> Ok
    | [ U; A; C ] -> UAC Tyrosine |> Ok
    | [ U; G; U ] -> UGU Cysteine |> Ok
    | [ U; G; C ] -> UGC Cysteine |> Ok
    | [ U; G; G ] -> UGG Tryptophan |> Ok
    | [ U; A; A ] -> UAA |> Ok
    | [ U; A; G ] -> UAG |> Ok
    | [ U; G; A ] -> UGA |> Ok
    | _ -> Error "Invalid codon"

let private toAminoAcid (codon: Codon) : AminoAcid option =
    match codon with
    | AUG aa -> Some aa
    | UUU aa -> Some aa
    | UUC aa -> Some aa
    | UUA aa -> Some aa
    | UUG aa -> Some aa
    | UCU aa -> Some aa
    | UCC aa -> Some aa
    | UCA aa -> Some aa
    | UCG aa -> Some aa
    | UAU aa -> Some aa
    | UAC aa -> Some aa
    | UGU aa -> Some aa
    | UGC aa -> Some aa
    | UGG aa -> Some aa
    | UAA
    | UAG
    | UGA -> None

let private seqOfResultsToResultWithList (sqnce: Result<Nucleobase, string> seq) : Result<Nucleobase list, string> =
    let rec loop acc results =
        match results with
        | [] ->
            match acc with
            | Ok lst -> Ok(List.rev lst)
            | Error _ -> Error "This should never happen"

        | Ok nuc :: rest ->
            match acc with
            | Ok lst -> loop (Ok(nuc :: lst)) rest
            | Error _ -> Error "This should never happen"

        | Error err :: _ -> Error err

    loop (Ok []) (Seq.toList sqnce)

let codonBinder (triples: Nucleobase list list) : Result<Codon list, string> =
    let rec loop acc coll =
        match coll with
        | [] -> Ok(List.rev acc)
        | triple :: rest ->
            let cd = toCodon triple

            match cd with
            | Ok cdn -> loop (cdn :: acc) rest
            | Error err -> Error err

    loop [] triples

let aaBinder (codons: Codon list) : Result<Protein, string> =
    let rec loop acc coll =
        match coll with
        | [] -> Ok(List.rev acc)
        | cdn :: rest ->
            match toAminoAcid cdn with
            | Some aa -> loop (aa :: acc) rest
            | None -> Ok(List.rev acc)

    loop [] codons

let private resultProtein (rna: string) : Result<Protein, string> =
    rna
    |> Seq.map toBase
    |> seqOfResultsToResultWithList
    |> Result.map (List.chunkBySize 3)
    |> Result.bind codonBinder
    |> Result.bind aaBinder

let proteins (rna: string) =
    resultProtein rna
    |> Result.defaultValue []
    |> List.map (fun aa -> aa.ToString())
