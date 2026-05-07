tailrec fun reverse(input: String, acc: String = ""): String =
    if (input.isEmpty()) acc else reverse(input.drop(1), input.first() + acc)


