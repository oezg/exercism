object Bob {
    fun hey(input: String): String {
        return when {
            input.isBlank() -> "Fine. Be that way!"
            input.trim().endsWith("?") ->
                if (input.isYell())
                    "Calm down, I know what I'm doing!"
                else
                    "Sure."
            input.isYell() -> "Whoa, chill out!"
            else -> "Whatever."
        }
    }
}

fun String.isYell() = any {it.isUpperCase()} && none { it.isLowerCase() }
