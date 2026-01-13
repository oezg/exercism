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

  private static final Stream<List<Integer>> combinationsWithSum(
      List<Integer> input, int k, int subtotal, List<Integer> acc) {
    // Base conditions
    if (k == 0 && subtotal == 0) return Stream.of(acc);
    Integer head;
    if (k == 0 || input.isEmpty() || subtotal < (head = input.getFirst())) return Stream.empty();

    // Combinations without the first element
    var tail = input.stream().skip(1).toList();
    var withoutHead = combinationsWithSum(tail, k, subtotal, acc);

    // Combinations with the first element
    var newacc = Stream.concat(acc.stream(), Stream.of(head)).toList();
    var withHead = combinationsWithSum(tail, k - 1, subtotal - head, newacc);

    return Stream.concat(withHead, withoutHead);
  }
}
