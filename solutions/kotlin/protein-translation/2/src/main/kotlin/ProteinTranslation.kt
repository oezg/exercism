fun translate(rna: String?): List<String> =
    (rna ?: "").chunkedSequence(3) {
        when (it) {
            "AUG" -> AminoAcid.Methionine
            "UUU", "UUC" -> AminoAcid.Phenylalanine
            "UUA", "UUG" -> AminoAcid.Leucine
            "UCU", "UCC", "UCA", "UCG" -> AminoAcid.Serine
            "UAU", "UAC" -> AminoAcid.Tyrosine
            "UGU", "UGC" -> AminoAcid.Cysteine
            "UGG" -> AminoAcid.Tryptophan
            "UAA", "UAG", "UGA" -> Stop
            else -> throw IllegalArgumentException("Invalid codon")
        }
    }.takeWhile { it is AminoAcid }.map { (it as AminoAcid).name }.toList()

sealed interface Codon
object Stop : Codon
enum class AminoAcid : Codon {
    Methionine, Phenylalanine, Leucine, Serine, Tyrosine, Cysteine, Tryptophan
}
