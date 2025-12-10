import java.util.ArrayList;
import java.util.List;

class PrimeCalculator {
  List<Integer> primes = new ArrayList<>(List.of(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37));

  int nth(int nth) {
    if (nth < 1) throw new IllegalArgumentException("Nth must be positive");

    final int n = nth - 1;
    int nextPrime = primes.getLast();
    while (primes.size() <= n) {
      nextPrime = nextPrime(nextPrime);
      primes.add(nextPrime);
    }

    return primes.get(n);
  }

  int nextPrime(int odd) {
    do odd += 2;
    while (!isPrime(odd));
    return odd;
  }

  boolean isPrime(int candidate) {
    final int limit = (int) Math.sqrt(candidate);
    for (int prime : primes) {
      if (candidate % prime == 0) return false;
      if (limit < prime) return true;
    }
    return true;
  }
}
