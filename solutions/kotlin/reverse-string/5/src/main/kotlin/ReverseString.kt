fun reverse(input: String): String {
    tailrec fun go(rest: String, acc: StringBuilder): StringBuilder =
        if (rest.isEmpty()) acc
        else go(rest.substring(1), acc.append(rest.first()))

    return go(input, StringBuilder()).reverse().toString()
}