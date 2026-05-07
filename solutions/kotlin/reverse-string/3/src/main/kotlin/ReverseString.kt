fun reverse(input: String, acc: String = ""): String =
    if (input.isEmpty()) acc else input.run {
        reverse(drop(1), first() + acc)
    }


