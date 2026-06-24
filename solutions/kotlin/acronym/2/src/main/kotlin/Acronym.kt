object Acronym {
    fun generate(phrase: String): String = buildString {
        var wordStart = true
        for (c in phrase) {
            if (wordStart && (c in 'a'..'z' || c in 'A'..'Z')) {
                append(c)
                wordStart = false
            } else if (!wordStart && (c == ' ' || c == '-')) {
                wordStart = true
            }
        }
    }.uppercase()
}
