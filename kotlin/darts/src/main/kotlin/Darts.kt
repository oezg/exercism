import kotlin.math.hypot
import kotlin.math.ceil

object Darts {

    fun score(x: Number, y: Number): Int =
        when (ceil(hypot(x.toDouble(), y.toDouble())).toInt()) {
            in 0..1 -> 10
            in 2..5 -> 5
            in 6..10 -> 1
            else -> 0
        }
}
