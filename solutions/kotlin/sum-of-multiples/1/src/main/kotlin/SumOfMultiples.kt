object SumOfMultiples {

    fun sum(factors: Set<Int>, limit: Int): Int {
        return (1 until limit).filter { n -> factors.any { it != 0 && n % it == 0 } }.sum()
    }
}
