object PrimeFactorCalculator {

  fun primeFactors(int: Int): List<Int> = primeFactors(int.toLong()).map(Long::toInt)

  fun primeFactors(long: Long): List<Long> = buildList {
    var factorized = long

    tailrec fun factorBy(nominator: Long, prime: Long): Long {
      if (nominator % prime > 0) return nominator
      add(prime)
      return factorBy(nominator / prime, prime)
    }

    primes.forEach { prime ->
      if (prime * prime > factorized) return@forEach
      factorized = factorBy(factorized, prime)
    }

    fun addNewPrime(newPrime: Long) {
      primes.add(newPrime)
      factorized = factorBy(factorized, newPrime)
    }

    tailrec fun extendPrimes(candidate: Long) {
      if (candidate * candidate > factorized) return
      if (primes.all { candidate % it > 0 }) addNewPrime(candidate)
      extendPrimes(candidate + 2)
    }

    extendPrimes(primes.last() + 2)

    if (factorized > 1) addNewPrime(factorized)
  }

  private val primes = mutableListOf<Long>(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31)
}