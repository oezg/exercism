fun reverse(input: String): String = buildString(input.length) {
    input.indices.reversed().forEach { append(input[it]) }
}