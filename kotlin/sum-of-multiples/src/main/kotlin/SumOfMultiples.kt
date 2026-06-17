object SumOfMultiples {

    fun sum(factors: Set<Int>, limit: Int): Int = buildSet {
        (factors - 0).forEach {
            (0 until limit step it).forEach(::add)
        }
    }.sum()
}
