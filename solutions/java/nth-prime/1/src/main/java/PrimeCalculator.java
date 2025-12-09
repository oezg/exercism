import java.util.ArrayList;
import java.util.List;

class PrimeCalculator {
  List<Integer> primes = new ArrayList<>(List.of(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37));

  int nth(int nth) {
    if (nth < 1) {
      throw new IllegalArgumentException("Nth must be positive");
    }

    var count = primes.size();
    if (nth <= count) {
      return primes.get(nth - 1);
    }

    while (count < nth) {
      var candidate = primes.get(count - 1) + 2;
      while (!isPrime(candidate)) {
        candidate += 2;
      }
      primes.add(candidate);
      count++;
    }

    return primes.get(nth - 1);
  }

  boolean isPrime(int candidate) {
    for (Integer prime : primes) {
      if (candidate % prime == 0) {
        return false;
      }
      if (Math.sqrt(candidate) < prime) {
        return true;
      }
    }
    return true;
  }
}
