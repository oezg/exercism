fun transcribeToRna(dna: String): String =
    dna.map(DnaBase::fromChar)
        .map(DnaBase::transcribe)
        .joinToString("") { it.symbol.toString() }


private fun DnaBase.transcribe(): RnaBase =
    when(this) {
        Guanine -> Cytosine
        Cytosine -> Guanine
        Thymine -> Adenine
        Adenine -> Uracil
    }

sealed interface Nucleobase {
    val symbol: Char
}

sealed interface DnaBase : Nucleobase {
    companion object {
        val all = listOf<DnaBase>(Adenine, Guanine, Cytosine, Thymine)
        fun fromChar(char: Char): DnaBase =
            all.find { it.symbol == char } ?: error("Invalid DNA base: $char")
    }
}

sealed interface RnaBase : Nucleobase

object Guanine : DnaBase, RnaBase {
    override val symbol = 'G'
}

object Adenine : DnaBase, RnaBase {
    override val symbol = 'A'
}

object Cytosine : DnaBase, RnaBase {
    override val symbol = 'C'
}

object Thymine : DnaBase {
    override val symbol = 'T'
}

object Uracil : RnaBase {
    override val symbol = 'U'
}
