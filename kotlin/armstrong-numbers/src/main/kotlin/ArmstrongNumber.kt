import kotlin.math.pow

object ArmstrongNumber {

  fun check(input: Int): Boolean =
      with(input) {
        toDouble() ==
            toString().run {
              sumOf {
                it.digitToInt().toDouble().pow(length)
              }
            }
      }
}
