"determine the RNA complement of a given DNA sequence."

def to_rna(dna_strand: str) -> str:
    "Given a DNA strand, transcribe its RNA strand."
    return dna_strand.translate(str.maketrans("GCTA", "CGAU"))
