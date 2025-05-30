from collections.abc import Generator


CODON_SIZE = 3

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
    "UAA": None,
    "UAG": None,
    "UGA": None,
}


def proteins(strand: str) -> list[str]:
    return list(takewhile(batch(strand)))


def batch(strand: str) -> Generator[str, None, None]:
    for i in range(0, len(strand), CODON_SIZE):
        yield strand[i : i + CODON_SIZE]


def takewhile(codons: Generator[str, None, None]) -> Generator[str, None, None]:
    for codon in codons:
        amino_acid = AMINOACIDS[codon]
        if amino_acid is None:
            break
        yield amino_acid
