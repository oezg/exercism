import java.util.ArrayList;
import java.util.List;

class PrimeCalculator {
  List<Integer> primes = new ArrayList<>(List.of(2, 3));

  int nth(int n) {
    if (n < 1) throw new IllegalArgumentException("n must be positive");

    while (primes.size() < n) primes.add(nextPrime(primes.getLast()));

    return primes.get(n - 1);
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
