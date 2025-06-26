import java.util.ArrayList;
import java.util.Deque;
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
    List<String> chunks = chunk(number);
    return String.join(" ", intersperse(chunks));
  }

  private static Deque<String> intersperse(List<String> chunks) {
    Deque<String> out = new LinkedList<>();
    for (int i = 0; i < chunks.size(); i++) {
      String chunk = chunks.get(i);
      String scale = scales[i];
      if (chunk == null) {
        continue;
      }
      out.push(scale == null ? chunk : chunk + " " + scale);
    }
    return out;
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

  static List<String> chunk(long number) {
    List<String> out = new ArrayList<String>();
    while (number > 0) {
      out.add(translate((int) (number % 1000)));
      number /= 1000;
    }
    return out;
  }

  private static void validate(long number) {
    if (number < 0 || number > 999_999_999_999L) {
      throw new IllegalArgumentException("number must be in range [0, 1_000_000_000_000)");
    }
  }
}
