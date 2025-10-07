import java.util.LinkedList;
import java.util.List;
import java.util.function.IntPredicate;
import java.util.stream.IntStream;

class DiamondPrinter {
  static final char charA = 'A';

  List<String> printToList(char a) {
    List<String> result = new LinkedList<>();
    for (char i = a; i >= charA; i--) {
      String line = createLine(a, i);
      result.addFirst(line);
      if (i < a) result.addLast(line);
    }
    return result;
  }

  static String createLine(char target, char current) {
    int n = target - charA;
    IntPredicate isit = i -> i == target - current || i == n + current - charA;
    return IntStream.rangeClosed(0, 2 * n)
        .mapToObj(i -> isit.test(i) ? current : ' ')
        .collect(StringBuilder::new, StringBuilder::append, StringBuilder::append)
        .toString();
  }
}
