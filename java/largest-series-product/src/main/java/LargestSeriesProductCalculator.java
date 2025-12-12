import java.util.ArrayList;
import java.util.List;

class LargestSeriesProductCalculator {
  List<Integer> digits = new ArrayList<>();

  LargestSeriesProductCalculator(String inputNumber) {
    int digit;
    for (char character : inputNumber.toCharArray())
      if ((digit = Character.digit(character, 10)) < 0)
        fail("String to search may only contain digits.");
      else digits.add(digit);
  }

  long calculateLargestProductForSeriesLength(int span) {
    if (span < 0) fail("Series length must be non-negative.");
    if (digits.size() < span)
      fail("Series length must be less than or equal to the length of the string to search.");
    long maximum = 0;
    for (int start = 0; start <= digits.size() - span; start++) {
      long product = 1;
      for (int i = 0; i < span; i++) product *= digits.get(start + i);
      if (maximum < product) maximum = product;
    }
    return maximum;
  }

  private static void fail(String message) {
    throw new IllegalArgumentException(message);
  }
}
