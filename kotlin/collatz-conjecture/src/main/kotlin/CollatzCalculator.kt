object CollatzCalculator {
    val collatzStep = { x: Int -> if (x % 2 == 0) x / 2 else x * 3 + 1 }

    fun computeStepCount(start: Int): Int {
        require(start > 0) { "Only natural numbers are allowed"}
        return generateSequence(start, collatzStep).takeWhile { it != 1 } .count()
    }
}