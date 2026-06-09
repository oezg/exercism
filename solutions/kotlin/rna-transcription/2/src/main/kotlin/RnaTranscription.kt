fun transcribeToRna(dna: String): String =
    dna.map(::rnaFromDna).joinToString("")

private fun rnaFromDna(dna: Char): Char =
    when(dna) {
        'G' -> 'C'
        'C' -> 'G'
        'T' -> 'A'
        'A' -> 'U'
        else -> throw IllegalArgumentException("Invalid nucleotide: $dna")
    }