import java.util.function.IntPredicate;
import java.util.stream.IntStream;

public class Hamming {
  private final long distance;

  public Hamming(String leftStrand, String rightStrand) {
    int length = leftStrand.length();
    if (rightStrand.length() != length) {
      throw new IllegalArgumentException("strands must be of equal length");
    }
    IntPredicate hamming = index -> leftStrand.charAt(index) != rightStrand.charAt(index);
    IntPredicate condition = index -> index < length;
    distance = IntStream.iterate(0, condition, index -> index + 1).filter(hamming).count();
  }

  public long getHammingDistance() {
    return distance;
  }
}
