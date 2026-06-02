object Isogram {

    fun isIsogram(input: String) =
        input.lowercase()
            .filter { it.isLowerCase() }
            .groupingBy { it }
            .eachCount()
            .all { it.value == 1}
}
