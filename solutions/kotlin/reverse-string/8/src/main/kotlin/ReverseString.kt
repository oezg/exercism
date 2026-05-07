fun reverse(input: String): String = buildString(input.length) {
    (input.length - 1 downTo 0).forEach { append(input[it]) }
}