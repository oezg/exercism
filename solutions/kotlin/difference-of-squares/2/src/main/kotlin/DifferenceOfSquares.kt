data class Squares(val n: Int) {
    fun sumOfSquares() = n.inc().times(2.times(n).inc().times(n)).div(6)

    fun squareOfSum() = n.times(n.inc()).div(2).let {it.times(it)}

    fun difference() = squareOfSum().minus(sumOfSquares())
}
