data class Squares(val n: Int) {
    private val sumSquares: Int by lazy {
        (1..n).sumOf { it * it }
    }

    private val squareSum: Int by lazy {
        val sum = (1..n).sum()
        sum * sum
    }
    fun sumOfSquares(): Int {
        return sumSquares
    }

    fun squareOfSum(): Int {
        return squareSum
    }

    fun difference(): Int {
        return squareSum - sumSquares
    }
}
