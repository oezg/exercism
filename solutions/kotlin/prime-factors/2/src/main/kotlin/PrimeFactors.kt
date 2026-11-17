import kotlin.math.ceil
import kotlin.math.sqrt

object PrimeFactorCalculator {

  fun primeFactors(int: Int): List<Int> = primeFactors(int.toLong()).map { it.toInt() }

  fun primeFactors(long: Long): List<Long> {
    val result = mutableListOf<Long>()
    var n = long
    while (n % 2 == 0L) {
      n /= 2
      result.add(2)
    }
    if (n == 1L) return result
    val root = ceil(sqrt(n.toDouble())).toInt()
    val sieve =
      BooleanArray(root + 1) {
        it % 2 == 1
      }
    sieve[1] = false
    sieve[2] = true
    for (i in 3..root step 2) {
      if (sieve[i]) {
        for (j in 2 * i..root step i) {
          sieve[j] = false
        }
        while (n % i == 0L) {
          n /= i
          result.add(i.toLong())
        }
      }
    }
    if (n > 1) result.add(n)
    return result
  }
}
