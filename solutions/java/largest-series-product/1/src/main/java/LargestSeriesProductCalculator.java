import java.util.ArrayList;
import java.util.List;

class LargestSeriesProductCalculator {
  List<Integer> digits = new ArrayList<>();
  int inputLength;

  LargestSeriesProductCalculator(String inputNumber) {
    for (char character : inputNumber.toCharArray()) {
      var digit = Character.digit(character, 10);
      if (digit < 0) {
        throw new IllegalArgumentException("String to search may only contain digits.");
      }
      digits.add(digit);
    }
    inputLength = digits.size();
  }

  long calculateLargestProductForSeriesLength(int numberOfDigits) {
    if (numberOfDigits < 0) {
      throw new IllegalArgumentException("Series length must be non-negative.");
    }
    if (inputLength < numberOfDigits) {
      throw new IllegalArgumentException(
          "Series length must be less than or equal to the length of the string to search.");
    }
    long maximum = 0;
    for (int i = 0; i <= inputLength - numberOfDigits; i++) {
      long product = 1;
      for (int j = 0; j < numberOfDigits; j++) {
        product *= digits.get(i + j);
      }
      if (maximum < product) {
        maximum = product;
      }
    }
    return maximum;
  }
}
