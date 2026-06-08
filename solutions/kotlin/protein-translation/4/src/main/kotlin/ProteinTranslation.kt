fun translate(rna: String?): List<String> = 
    rnaSeq(rna ?: "").map { it.name }.toList()

fun rnaSeq(rna: String): Sequence<AminoAcid> =
    rna.chunkedSequence(3) {
        when (it) {
            "AUG" -> TranslationResult.Continue(AminoAcid.Methionine)
            "UUU", "UUC" -> TranslationResult.Continue(AminoAcid.Phenylalanine)
            "UUA", "UUG" -> TranslationResult.Continue(AminoAcid.Leucine)
            "UCU", "UCC", "UCA", "UCG" -> TranslationResult.Continue(AminoAcid.Serine)
            "UAU", "UAC" -> TranslationResult.Continue(AminoAcid.Tyrosine)
            "UGU", "UGC" -> TranslationResult.Continue(AminoAcid.Cysteine)
            "UGG" -> TranslationResult.Continue(AminoAcid.Tryptophan)
            "UAA", "UAG", "UGA" -> TranslationResult.Stop
            else -> throw IllegalArgumentException("Invalid codon")
        }
    }.takeWhile { it is TranslationResult.Continue }.mapNotNull { (it as? TranslationResult.Continue)?.aminoAcid }

sealed interface TranslationResult {
    object Stop : TranslationResult
    data class Continue(val aminoAcid: AminoAcid) : TranslationResult 
}

enum class AminoAcid {
    Methionine, Phenylalanine, Leucine, Serine, Tyrosine, Cysteine, Tryptophan
}

