module ProteinTranslation

type AminoAcid =
    | Methionine
    | Phenylalanine
    | Leucine
    | Serine
    | Tyrosine
    | Cysteine
    | Tryptophan

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


let translate (codon: Codon) : AminoAcid option =
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




let proteins rna = []
