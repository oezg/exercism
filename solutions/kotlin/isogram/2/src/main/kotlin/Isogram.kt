object Isogram {

    fun isIsogram(input: String) =
        input
            .asSequence()
            .filter(Char::isLetter)
            .map(Char::lowercaseChar)
            .runningFold<Char, Set<Char>?>(emptySet()) { seen, curr ->
                seen?.takeIf { curr !in seen }?.plus(curr)
            }
            .none { it == null}
}
