data class Dna(val dna: String) {

    init {
        require(dna.all { it in listOf('A', 'C', 'G', 'T') }) { "invalid nucleotide" }
    }

    val nucleotideCounts: Map<Char, Int> by lazy {
        mapOf('A' to 0, 'C' to 0, 'G' to 0, 'T' to 0).plus(dna.groupingBy { it }.eachCount())
    }
}
