object CollatzCalculator {
    fun computeStepCount(start: Int): Int {
        require(start > 0) { "Only natural numbers are allowed"}
        if (start == 1) return 0
        return generateSequence(start) {
            val step = it.collatzStep
            if (step == 1) null else step
        }.count()
    }
}

private val Int.collatzStep: Int
    get() = if (mod(2) == 0) div(2) else times(3).plus(1)