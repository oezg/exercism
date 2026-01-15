import java.util.BitSet;
import java.util.List;

class Sieve {
  private final BitSet bitSet = new BitSet();

  Sieve(int maxPrime) {
    bitSet.set(2, ++maxPrime);
    for (int i = 2; i < maxPrime; i++)
      if (bitSet.get(i)) for (int j = i + i; j < maxPrime; j += i) bitSet.clear(j);
  }

  List<Integer> getPrimes() {
    return bitSet.stream().boxed().toList();
  }
}
