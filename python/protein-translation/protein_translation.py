from itertools import takewhile

CODON_SIZE = 3

STOP_CODONS = ("UAA", "UAG", "UGA")

AMINOACIDS = {
    "AUG": "Methionine",
    "UUU": "Phenylalanine",
    "UUC": "Phenylalanine",
    "UUA": "Leucine",
    "UUG": "Leucine",
    "UCU": "Serine",
    "UCC": "Serine",
    "UCA": "Serine",
    "UCG": "Serine",
    "UAU": "Tyrosine",
    "UAC": "Tyrosine",
    "UGU": "Cysteine",
    "UGC": "Cysteine",
    "UGG": "Tryptophan",
}


def proteins(strand: str) -> list[str]:
    return [
        AMINOACIDS[codon]
        for codon in takewhile(
            lambda codon: codon not in STOP_CODONS,
            (strand[i : i + CODON_SIZE] for i in range(0, len(strand), CODON_SIZE)),
        )
    ]
