object CollatzCalculator {
    fun computeStepCount(start: Int): Int {
        tailrec fun go(n: Int, acc: Int): Int =
            if (n == 1) acc else go(n.collatzStep, acc + 1)

        require(start > 0) { "Only natural numbers are allowed"}
        return go(start, 0)
    }
}

private val Int.collatzStep: Int
    get() = if (mod(2) == 0) div(2) else times(3).plus(1)