data class Squares(val n: Int) {
    fun sumOfSquares() = n * (n + 1) * (2 * n + 1) / 6

    fun squareOfSum() = (n * (n + 1) / 2).let { it * it }

    fun difference() = squareOfSum() - sumOfSquares()
}
