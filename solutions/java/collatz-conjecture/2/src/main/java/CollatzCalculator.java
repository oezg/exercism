import java.util.stream.IntStream;

class CollatzCalculator {

  int computeStepCount(int start) {
    if (start < 1) throw new IllegalArgumentException("Only positive integers are allowed");
    return (int) IntStream.iterate(start, n -> n > 1, n -> n % 2 == 0 ? n / 2 : 3 * n + 1).count();
  }
}
