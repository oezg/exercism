object Acronym {
    fun generate(phrase: String): String =
        phrase.split(' ', '-')
            .mapNotNull { word -> word.firstOrNull { it in 'a'..'z' || it in 'A'..'Z' } }
            .joinToString("") { it.uppercase() }
}
