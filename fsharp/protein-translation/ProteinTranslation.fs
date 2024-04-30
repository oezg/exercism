module ProteinTranslation

type AminoAcid =
    | Methionine
    | Phenylalanine
    | Leucine
    | Serine
    | Tyrosine
    | Cysteine
    | Tryptophan

let aaToString (aa: AminoAcid) : string =
    match aa with
    | Methionine -> "Methionine"
    | Phenylalanine -> "Phenylalanine"
    | Leucine -> "Leucine"
    | Serine -> "Serine"
    | Tyrosine -> "Tyrosine"
    | Cysteine -> "Cysteine"
    | Tryptophan -> "Tryptophan"


type Protein = AminoAcid list


let toStringList (protein: Protein) : string list = List.map aaToString protein

type Codon =
    | AUG
    | UUU
    | UUC
    | UUA
    | UUG
    | UCU
    | UCC
    | UCA
    | UCG
    | UAU
    | UAC
    | UGU
    | UGC
    | UGG
    | UAA
    | UAG
    | UGA

let toCodon s : Result<Codon, string> =
    match s with
    | "AUG" -> AUG |> Ok
    | "UUU" -> UUU |> Ok
    | "UUC" -> UUC |> Ok
    | "UUA" -> UUA |> Ok
    | "UUG" -> UUG |> Ok
    | "UCU" -> UCU |> Ok
    | "UCC" -> UCC |> Ok
    | "UCA" -> UCA |> Ok
    | "UCG" -> UCG |> Ok
    | "UAU" -> UAU |> Ok
    | "UAC" -> UAC |> Ok
    | "UGU" -> UGU |> Ok
    | "UGC" -> UGC |> Ok
    | "UGG" -> UGG |> Ok
    | "UAA" -> UAA |> Ok
    | "UAG" -> UAG |> Ok
    | "UGA" -> UGA |> Ok
    | _ -> Error s


let toAminoAcid (codon: Codon) : AminoAcid option =
    match codon with
    | AUG -> Some Methionine
    | UUU
    | UUC -> Some Phenylalanine
    | UUA
    | UUG -> Some Leucine
    | UCU
    | UCC
    | UCA
    | UCG -> Some Serine
    | UAU
    | UAC -> Some Tyrosine
    | UGU
    | UGC -> Some Cysteine
    | UGG -> Some Tryptophan
    | UAA
    | UAG
    | UGA -> None


let chunk size s =
    let rec loop acc (remaining: string) =
        if remaining.Length <= size then
            remaining :: acc |> List.rev
        else
            loop (remaining[.. size - 1] :: acc) remaining[size..]

    loop [] s

let aggregateResults lst =
    let rec loop acc rest =
        match rest with
        | [] -> List.rev acc |> Ok
        | Ok aa :: aas -> loop (aa :: acc) aas
        | Error err :: _ -> Error err

    loop [] lst


let mapResult f result =
    match result with
    | Ok value -> f value |> Ok
    | Error err -> Error err

let truncateList lst =
    let rec takeUntilNone acc rest =
        match rest with
        | [] -> List.rev acc
        | Ok(Some x) :: xs -> takeUntilNone (Ok x :: acc) xs
        | Ok None :: _ -> List.rev acc
        | Error err :: _ -> List.rev (Error err :: acc)

    takeUntilNone [] lst

let resultProtein (rna: string) : Result<Protein, string> =
    chunk 3 rna
    |> List.map toCodon
    |> List.map (mapResult toAminoAcid)
    |> truncateList
    |> aggregateResults

let proteins (rna: string) =
    resultProtein rna |> Result.defaultValue [] |> toStringList
