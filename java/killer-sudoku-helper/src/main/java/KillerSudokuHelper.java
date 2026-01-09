import java.util.List;
import java.util.stream.Stream;

public class KillerSudokuHelper {

  List<List<Integer>> combinationsInCage(Integer cageSum, Integer cageSize, List<Integer> exclude) {
    return combinations(List.of(1, 2, 3, 4, 5, 6, 7, 8, 9), cageSize)
        .filter(
            cmb ->
                cmb.stream().reduce(0, Integer::sum) == cageSum
                    && !cmb.stream().anyMatch(i -> exclude.contains(i)))
        .toList();
  }

  List<List<Integer>> combinationsInCage(Integer cageSum, Integer cageSize) {
    return combinationsInCage(cageSum, cageSize, List.of());
  }

  static <T> Stream<List<T>> combinations(List<T> sequence, int size) {
    if (size == 0) return Stream.of(List.of());
    if (sequence.isEmpty()) return Stream.empty();
    List<T> tail = sequence.subList(1, sequence.size());
    return Stream.concat(
        combinations(tail, size - 1)
            .map(list -> Stream.concat(Stream.of(sequence.get(0)), list.stream()).toList()),
        combinations(tail, size));
  }
}
