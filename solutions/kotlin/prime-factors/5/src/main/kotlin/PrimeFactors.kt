import kotlin.math.sqrt

object PrimeFactorCalculator {
  fun primeFactors(int: Int): List<Int> = primeInts(int.toLong())

  fun primeFactors(long: Long): List<Long> = primeInts(long).map(Int::toLong)

  private val primes = mutableListOf(2, 3, 5, 7)

  private fun primeInts(long: Long): List<Int> {
    val factors = mutableListOf<Int>()
    var n = long
    tailrec fun reduceWith(prime: Int) {
      if (n % prime > 0) return
      n /= prime
      factors.add(prime)
      reduceWith(prime)
    }
    primes.forEach { reduceWith(it) }
    if (n == 1L) return factors

    val largestPrime = primes.last()
    val indexToValue: (Int) -> Int = { 2 * it + largestPrime + 2 }
    val sieve =
      BooleanArray((sqrt(n.toDouble()).toInt() - largestPrime) / 2) {
        primes.none { prime -> indexToValue(it) % prime == 0 }
      }

    for ((index, isPrime) in sieve.withIndex()) {
      if (!isPrime) continue
      val m = indexToValue(index)
      primes.add(m)
      reduceWith(m)
      ((index + m)..sieve.lastIndex step m).forEach { sieve[it] = false }
    }

    if (n == 1L) return factors

    require(n <= Int.MAX_VALUE) { "$n is a prime larger than 32 bit signed integer." }
    reduceWith(n.toInt())

    return factors
  }
}
