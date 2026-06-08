fun translate(rna: String?): List<String> =
    (rna ?: "").chunkedSequence(3) {
        when (it) {
            "AUG" -> AminoAcid.Methionine.toCodon()
            "UUU", "UUC" -> AminoAcid.Phenylalanine.toCodon()
            "UUA", "UUG" -> AminoAcid.Leucine.toCodon()
            "UCU", "UCC", "UCA", "UCG" -> AminoAcid.Serine.toCodon()
            "UAU", "UAC" -> AminoAcid.Tyrosine.toCodon()
            "UGU", "UGC" -> AminoAcid.Cysteine.toCodon()
            "UGG" -> AminoAcid.Tryptophan.toCodon()
            "UAA", "UAG", "UGA" -> Codon.Stop
            else -> throw IllegalArgumentException("Invalid codon")
        }
    }.takeWhile { it is Codon.Coding }.map { (it as Codon.Coding).aminoAcid.name }.toList()

sealed interface Codon {
    data class Coding(val aminoAcid: AminoAcid) : Codon
    object Stop : Codon
}

enum class AminoAcid {
    Methionine, Phenylalanine, Leucine, Serine, Tyrosine, Cysteine, Tryptophan;

    fun toCodon(): Codon.Coding {
        return Codon.Coding(this)
    }
}
