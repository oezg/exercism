import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

public class Say {
  private static final String[] scales = new String[] {null, "thousand", "million", "billion"};
  private static final String[] toTwenty =
      new String[] {
        null,
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine",
        "ten",
        "eleven",
        "twelve",
        "thirteen",
        "fourteen",
        "fifteen",
        "sixteen",
        "seventeen",
        "eighteen",
        "nineteen"
      };
  private static final String[] toHundred =
      new String[] {
        null, null, "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"
      };

  String say(long number) {
    validate(number);
    if (number == 0L) return "zero";
    List<String> nouns = new LinkedList<>(Arrays.asList(scales));
    return recSay(number, nouns, new LinkedList<String>());
  }

  private static String recSay(long number, List<String> nouns, List<String> result) {
    if (number == 0) {
      return String.join(" ", result);
    }
    String scale = nouns.removeFirst();
    String abc = translate((int) (number % 1000));
    if (abc != null) {
      result.addFirst(join(abc, scale, " "));
    }
    return recSay(number / 1000, nouns, result);
  }

  private static String translate(int number) {
    String hundredString = getHundred(number);
    String tenString = getTen(number);
    return join(hundredString, tenString, " ");
  }

  private static String join(String first, String second, String delimiter) {
    if (first == null) {
      if (second == null) return null;
      return second;
    }
    if (second == null) {
      return first;
    }
    return first + delimiter + second;
  }

  private static String getHundred(int number) {
    if (number < 100) return null;
    String countHundred = toTwenty[number / 100];
    return String.format("%s hundred", countHundred);
  }

  private static String getTen(int number) {
    number %= 100;
    if (number < 20) {
      return toTwenty[number];
    }
    String countTen = toHundred[number / 10];
    String countOne = toTwenty[number % 10];
    return join(countTen, countOne, "-");
  }

  private static void validate(long number) {
    if (number < 0 || number > 999_999_999_999L) {
      throw new IllegalArgumentException("number must be in range [0, 1_000_000_000_000)");
    }
  }
}
