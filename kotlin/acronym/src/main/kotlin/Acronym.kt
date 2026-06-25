object Acronym {
    fun generate(phrase: String): String =
        phrase.splitToSequence(' ', '-')
            .mapNotNull { word -> word.firstOrNull { it.isLetter() } }
            .joinToString("") { it.uppercase() }
}
