import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class KillerSudokuHelper {

  List<List<Integer>> combinationsInCage(Integer cageSum, Integer cageSize, List<Integer> exclude) {
    var a = IntStream.rangeClosed(1, 9).boxed().collect(Collectors.toList());
    a.removeAll(exclude);
    return mana(a, cageSize, cageSum, List.of()).toList();
  }

  List<List<Integer>> combinationsInCage(Integer cageSum, Integer cageSize) {
    return combinationsInCage(cageSum, cageSize, List.of());
  }

  static Stream<List<Integer>> mana(List<Integer> input, int k, int subtotal, List<Integer> acc) {
    if (k < 1) {
      if (subtotal == 0) return Stream.of(acc);
      else return Stream.empty();
    }
    if (input.size() < k) return Stream.empty();
    var head = input.getFirst();
    var tail = input.stream().skip(1).toList();
    var newacc = new ArrayList<>(acc);
    newacc.add(head);
    var withHead = mana(tail, k - 1, subtotal - head, newacc);
    var withoutHead = mana(tail, k, subtotal, acc);
    return Stream.concat(withHead, withoutHead);
  }
}
