fun reverse(input: String): String = buildString(input.length) {
    for (i in input.length - 1 downTo 0) {
        append(input[i])
    }
}