import java.util.function.IntPredicate;
import java.util.stream.IntStream;

class NaturalNumber {
  private final int number;
  private final IntStream factors;
  private final int aliquot;
  private final Classification classification;

  NaturalNumber(int number) {
    if (number <= 0) {
      throw new IllegalArgumentException("You must supply a natural number (positive integer)");
    }
    this.number = number;
    factors = factor();
    aliquot = sumFactors();
    classification = classify();
  }

  Classification getClassification() {
    return classification;
  }

  Classification classify() {
    if (number == aliquot) {
      return Classification.PERFECT;
    }
    if (number < aliquot) {
      return Classification.ABUNDANT;
    }
    return Classification.DEFICIENT;
  }

  int sumFactors() {
    return factors.reduce(0, (a, b) -> a + b);
  }

  IntStream factor() {
    IntPredicate isFactor = n -> number % n == 0;
    return IntStream.range(1, 1 + number / 2).filter(isFactor);
  }
}
