fun reverse(input: String): String {
    tailrec fun go(rest: String, acc: List<Char>): List<Char> =
        if (rest.isEmpty()) acc else go(rest.substring(1), listOf(rest.first()) + acc)

    return go(input, emptyList<Char>()).joinToString("")
}