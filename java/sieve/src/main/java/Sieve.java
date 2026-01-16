import java.util.BitSet;
import java.util.List;
import java.util.stream.IntStream;

class Sieve {
  private final BitSet bitSet = new BitSet();

  Sieve(int maxPrime) {
    bitSet.set(2, maxPrime + 1);
    IntStream.rangeClosed(2, maxPrime)
        .filter(bitSet::get)
        .forEach(i -> IntStream.rangeClosed(i, maxPrime / i).forEach(j -> bitSet.clear(i * j)));
  }

  List<Integer> getPrimes() {
    return bitSet.stream().boxed().toList();
  }
}
