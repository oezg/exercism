import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class KillerSudokuHelper {

  List<List<Integer>> combinationsInCage(Integer cageSum, Integer cageSize, List<Integer> exclude) {
    var include = IntStream.rangeClosed(1, 9).filter(n -> !exclude.contains(n)).boxed().toList();
    return combinationsWithSum(include, cageSize, cageSum, List.of()).toList();
  }

  List<List<Integer>> combinationsInCage(Integer cageSum, Integer cageSize) {
    return combinationsInCage(cageSum, cageSize, List.of());
  }

  static Stream<List<Integer>> combinationsWithSum(
      List<Integer> input, int k, int subtotal, List<Integer> acc) {
    if (k == 0 && subtotal == 0) return Stream.of(acc);
    if (k == 0 || input.isEmpty()) return Stream.empty();
    var head = input.getFirst();
    var tail = input.stream().skip(1).toList();
    var newacc = new ArrayList<>(acc);
    newacc.add(head);
    var withHead = combinationsWithSum(tail, k - 1, subtotal - head, newacc);
    var withoutHead = combinationsWithSum(tail, k, subtotal, acc);
    return Stream.concat(withHead, withoutHead);
  }
}
