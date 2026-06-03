data class Year(val year: Int) {
    val isLeap: Boolean by lazy { go(listOf(4, 100, 400)) }

    private tailrec fun go(divs: List<Int>, acc: Boolean = true): Boolean =
        if (year isDivisibleBy divs.firstOrNull()) go(divs.drop(1), !acc) else !acc
}

private infix fun Int.isDivisibleBy(divisor: Int?) = divisor != null && this % divisor == 0