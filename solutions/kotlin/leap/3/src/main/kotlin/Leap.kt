data class Year(val year: Int) {
    val isLeap
        get() = year isDivisibleBy 4 && !(year isDivisibleBy 100 && !(year isDivisibleBy 400))

    private infix fun Int.isDivisibleBy(divisor: Int): Boolean {
        require(divisor != 0)
        return this % divisor == 0
    }
}
