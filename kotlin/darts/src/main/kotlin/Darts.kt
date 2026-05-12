import kotlin.math.pow

object Darts {

    fun score(x: Number, y: Number): Int {
        val d = (x.toDouble().pow(2) + y.toDouble().pow(2)).pow(0.5)
        if (d > 10) return 0
        if (d > 5) return 1
        if (d > 1) return 5
        return 10
    }
}
