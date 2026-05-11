object CollatzCalculator {
    val nullAtOne = { x: Int -> if (x == 1) null else x}
    val collatzStep = { x: Int -> if (x % 2 == 0) x / 2 else x * 3 + 1 }
    fun computeStepCount(start: Int): Int {
        require(start > 0) { "Only natural numbers are allowed"}
        return generateSequence(nullAtOne(start)) { nullAtOne(collatzStep(it))}.count()
    }
}