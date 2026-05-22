object Bob {
    enum class Bobs {
        SILENCE, QUESTION, YELL, YELL_QUESTION, ANYTHING_ELSE
    }
    private fun String.toBobs(): Bobs {
        val isQuestion = lastOrNull { !it.isWhitespace() } == '?'
        val isYell = none { it.isLowerCase() } && any { it.isUpperCase() }
        return when {
            isBlank() -> Bobs.SILENCE
            isYell && isQuestion -> Bobs.YELL_QUESTION
            isYell -> Bobs.YELL
            isQuestion -> Bobs.QUESTION
            else -> Bobs.ANYTHING_ELSE
        }
    }

    fun hey(input: String): String {
        return when(input.toBobs()) {
            Bobs.SILENCE -> "Fine. Be that way!"
            Bobs.YELL_QUESTION -> "Calm down, I know what I'm doing!"
            Bobs.QUESTION -> "Sure."
            Bobs.YELL -> "Whoa, chill out!"
            Bobs.ANYTHING_ELSE -> "Whatever."
        }
    }
}
