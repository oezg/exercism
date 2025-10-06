import java.util.LinkedList;
import java.util.List;
import java.util.function.IntPredicate;
import java.util.stream.IntStream;

class DiamondPrinter {
  static final char A = 'A';

  List<String> printToList(char Chr) {
    List<String> result = new LinkedList<>();
    for (char i = Chr; i >= A; i--) {
      String line = createLine(Chr, i);
      result.addFirst(line);
      if (i < Chr) result.addLast(line);
    }
    return result;
  }

  static String createLine(char target, char current) {
    int n = target - A;
    IntPredicate isit = i -> i == target - current || i == n + current - A;
    return IntStream.rangeClosed(0, 2 * n)
        .mapToObj(i -> isit.test(i) ? current : ' ')
        .collect(StringBuilder::new, StringBuilder::append, StringBuilder::append)
        .toString();
  }
}
