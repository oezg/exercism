import static java.util.Map.entry;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

public class Say {
  private static final LinkedHashMap<Long, String> levels;

  static {
    levels = new LinkedHashMap<>();
    levels.put(1_000_000_000L, "billion");
    levels.put(1_000_000L, "million");
    levels.put(1_000L, "thousand");
  }

  public String say(long number) {
    if (number < 0 || number > 999_999_999_999L) {
      throw new IllegalArgumentException();
    }
    if (number == 0) {
      return "zero";
    }

    return translate(number);
  }

  private static String translate(long number) {
    for (Entry<Long, String> entry : levels.entrySet()) {
      var data = number % entry.getKey();
      number = number / entry.getKey();
    }
    var result = "";
    while (number > 0) {
      var last_three_digits = number % 1000;
      number /= 1000;
      result += underThousand(last_three_digits);
    }
    return result;
  }

  private static String underThousand(int number) {
    var hundred = number / 100;
    var hundreds = hundred == 0 ? "" : digitNames.get(hundred) + " hundred ";
    return hundreds + underHundred(number % 100);
  }

  private static String underHundred(int number) {
    if (number < 20) {
      return digitNames.get(number);
    }
    var ten = number / 10;
    var tens = tenNames.get(ten);
    return tens + "-" + digitNames.get(number % 10);
  }

  public static int pow10(int x) {
    var result = 1;
    while (x > 0) {
      result *= 10;
    }
    return result;
  }

  private static final Map<Integer, String> digitNames =
      Map.ofEntries(
          entry(1, "one"),
          entry(2, "two"),
          entry(3, "three"),
          entry(4, "four"),
          entry(5, "five"),
          entry(6, "six"),
          entry(7, "seven"),
          entry(8, "eight"),
          entry(9, "nine"),
          entry(10, "ten"),
          entry(11, "eleven"),
          entry(12, "twelve"),
          entry(13, "thirteen"),
          entry(14, "fourteen"),
          entry(15, "fifteen"),
          entry(16, "sixteen"),
          entry(17, "seventeen"),
          entry(18, "eighteen"),
          entry(19, "nineteen"));

  private static final Map<Integer, String> tenNames =
      Map.ofEntries(
          entry(2, "twenty"),
          entry(3, "thirty"),
          entry(4, "forty"),
          entry(5, "fifty"),
          entry(6, "sixty"),
          entry(7, "seventy"),
          entry(8, "eighty"),
          entry(9, "ninety"),
          entry(100, "hundred"),
          entry(1_000, "thousand"),
          entry(1_000_000, "million"),
          entry(1_000_000_000, "billion"));
}
