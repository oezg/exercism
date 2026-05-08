object CollatzCalculator {
    fun computeStepCount(start: Int): Int {
        require(start > 0)
        tailrec fun go(n: Int, acc: Int): Int =
            if (n == 1) acc
            else if (n % 2 == 0) go(n / 2, acc + 1)
            else go(3 * n + 1, acc + 1)
        return go(start, 0)
    }
}
