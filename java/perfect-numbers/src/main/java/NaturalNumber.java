import java.util.stream.IntStream;

class NaturalNumber {

  private final Classification classification;

  NaturalNumber(int number) {
    if (number <= 0) {
      throw new IllegalArgumentException("You must supply a natural number (positive integer)");
    }
    classification = classify(number);
  }

  Classification getClassification() {
    return classification;
  }

  private static Classification classify(int number) {
    int aliquot = IntStream.rangeClosed(1, number / 2).filter(n -> number % n == 0).sum();
    if (number > aliquot) return Classification.DEFICIENT;
    if (number < aliquot) return Classification.ABUNDANT;
    return Classification.PERFECT;
  }
}
