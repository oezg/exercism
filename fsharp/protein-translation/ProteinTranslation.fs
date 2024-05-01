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

(* How can I get the values of Codon to loop through them to find the right codon? *)
let private toCodon s : Result<Codon, string> =
    match s with
    | "AUG" -> AUG Methionine |> Ok
    | "UUU" -> UUU Phenylalanine |> Ok
    | "UUC" -> UUC Phenylalanine |> Ok
    | "UUA" -> UUA Leucine |> Ok
    | "UUG" -> UUG Leucine |> Ok
    | "UCU" -> UCU Serine |> Ok
    | "UCC" -> UCC Serine |> Ok
    | "UCA" -> UCA Serine |> Ok
    | "UCG" -> UCG Serine |> Ok
    | "UAU" -> UAU Tyrosine |> Ok
    | "UAC" -> UAC Tyrosine |> Ok
    | "UGU" -> UGU Cysteine |> Ok
    | "UGC" -> UGC Cysteine |> Ok
    | "UGG" -> UGG Tryptophan |> Ok
    | "UAA" -> UAA |> Ok
    | "UAG" -> UAG |> Ok
    | "UGA" -> UGA |> Ok
    | _ -> Error s

(* A simplification candidate but I don't kow yet how.*)
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

(* Do I have to invent the wheel? It seems String does not have a predefined chunk function. Just read your comment will work on it!*)
let private chunk size s =
    let rec loop acc (remaining: string) =
        if remaining.Length <= size then
            remaining :: acc |> List.rev
        else
            loop (remaining[.. size - 1] :: acc) remaining[size..]

    loop [] s

(* Do I have to invent the wheel? *)
let private aggregateResults lst =
    let rec loop acc rest =
        match rest with
        | [] -> List.rev acc |> Ok
        | Ok aa :: aas -> loop (aa :: acc) aas
        | Error err :: _ -> Error err

    loop [] lst


(* Just read your comment will work on it!*)
let private truncateList lst =
    let rec takeUntilNone acc rest =
        match rest with
        | [] -> List.rev acc
        | Ok(Some x) :: xs -> takeUntilNone (Ok x :: acc) xs
        | Ok None :: _ -> List.rev acc
        | Error err :: _ -> List.rev (Error err :: acc)

    takeUntilNone [] lst

let private resultProtein (rna: string) : Result<Protein, string> =
    chunk 3 rna
    |> List.map toCodon
    |> List.map (Result.map toAminoAcid)
    |> truncateList
    |> aggregateResults

let proteins (rna: string) =
    resultProtein rna
    |> Result.defaultValue []
    |> List.map (fun aa -> aa.ToString())
