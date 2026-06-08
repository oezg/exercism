fun translate(rna: String?): List<String> = (rna ?: "").chunkedSequence(3) {
    when (it) {
        "AUG" -> Codon.Coding.Methionine
        "UUU", "UUC" -> Codon.Coding.Phenylalanine
        "UUA", "UUG" -> Codon.Coding.Leucine
        "UCU", "UCC", "UCA", "UCG" -> Codon.Coding.Serine
        "UAU", "UAC" -> Codon.Coding.Tyrosine
        "UGU", "UGC" -> Codon.Coding.Cysteine
        "UGG" -> Codon.Coding.Tryptophan
        "UAA", "UAG", "UGA" -> Codon.Stop
        else -> throw IllegalArgumentException("Invalid codon")
    }
}.takeWhile { it is Codon.Coding }.map { (it as Codon.Coding).name }.toList()

sealed interface Codon {
    object Stop : Codon
    enum class Coding : Codon {
        Methionine, Phenylalanine, Leucine, Serine, Tyrosine, Cysteine, Tryptophan
    }
}

