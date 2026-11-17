import kotlin.math.sqrt

object PrimeFactorCalculator {
  fun primeFactors(int: Int): List<Int> = primeInts(int.toLong())

  fun primeFactors(long: Long): List<Long> = primeInts(long).map(Int::toLong)

  private const val EVEN_PRIME = 2

  private val oddPrimes = mutableListOf(3, 5, 7)

  private fun primeInts(long: Long): List<Int> {
    val result = mutableListOf<Int>()
    var n = reduce(long, EVEN_PRIME, result)
    oddPrimes.forEach {
      n = reduce(n, it, result)
    }
    if (n == 1L) return result

    val largestPrime = oddPrimes.last()
    val indexToValue: (Int) -> Int = { 2 * it + largestPrime + 2 }
    val sieve =
      BooleanArray((sqrt(n.toDouble()).toInt() - largestPrime) / EVEN_PRIME) {
        oddPrimes.none { prime -> indexToValue(it) % prime == 0 }
      }

    for ((index, isPrime) in sieve.withIndex()) {
      if (!isPrime) continue
      val m = indexToValue(index)
      oddPrimes.add(m)
      n = reduce(n, m, result)
      ((index + m)..sieve.lastIndex step m).forEach { sieve[it] = false }
    }

    if (n == 1L) return result

    require(n <= Int.MAX_VALUE) { "$n is a prime larger than 32 bit signed integer." }
    n = reduce(n, n.toInt(), result)

    return result
  }

  private fun reduce(n: Long, m: Int, out: MutableList<Int>): Long {
    var x = n
    while (x % m == 0L) {
      x /= m
      out.add(m)
    }
    return x
  }
}
