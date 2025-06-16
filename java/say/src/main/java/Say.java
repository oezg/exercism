import static java.util.Map.entry;

import java.util.Map;

public class Say {
  Map<Long, String> mapper =
      Map.ofEntries(
          entry(0L, "zero"),
          entry(1L, "one"),
          entry(2L, "two"),
          entry(3L, "three"),
          entry(4L, "four"),
          entry(5L, "five"),
          entry(6L, "six"),
          entry(7L, "seven"),
          entry(8L, "eight"),
          entry(9L, "nine"),
          entry(10L, "ten"),
          entry(11L, "eleven"),
          entry(12L, "twelve"),
          entry(13L, "thirteen"),
          entry(14L, "fourteen"),
          entry(15L, "fifteen"),
          entry(16L, "sixteen"),
          entry(17L, "seventeen"),
          entry(18L, "eighteen"),
          entry(19L, "nineteen"),
          entry(20L, "twenty"),
          entry(30L, "thirty"),
          entry(40L, "forty"),
          entry(50L, "fifty"),
          entry(60L, "sixty"),
          entry(70L, "seventy"),
          entry(80L, "eighty"),
          entry(90L, "ninety"),
          entry(100L, "hundred"),
          entry(1_000L, "thousand"),
          entry(1_000_000L, "million"),
          entry(1_000_000_000L, "billion"));

  public String say(long number) {
    if (number < 20) {
      return mapper.get(number);
    }
    var teen = number / 10 * 10;
    var ones = number % 10;
    if (ones == 0) {
      return mapper.get(teen);
    }
    return mapper.get(teen) + "-" + mapper.get(ones);
  }
}
