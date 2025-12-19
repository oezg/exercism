import java.util.Map;
import java.util.function.BiFunction;
import java.util.function.BinaryOperator;
import java.util.stream.Collectors;
import java.util.stream.Stream;

final class NucleotideCounter {
  private final Map<Character, Integer> counts;

  private static final Map<Character, Integer> origin = Map.of('A', 0, 'C', 0, 'G', 0, 'T', 0);

  private static final BiFunction<Map<Character, Integer>, Character, Map<Character, Integer>>
      accumulator =
          (acc, cur) ->
              Stream.concat(
                      acc.entrySet().stream(),
                      Stream.of(Map.entry(cur, acc.getOrDefault(cur, -2) + 1)))
                  .peek(
                      entry -> {
                        if (entry.getValue() < 0) throw new IllegalArgumentException();
                      })
                  .collect(
                      Collectors.toUnmodifiableMap(
                          Map.Entry::getKey, Map.Entry::getValue, NucleotideCounter::second));

  private static final BinaryOperator<Map<Character, Integer>> combiner =
      (left, right) ->
          Stream.concat(left.entrySet().stream(), right.entrySet().stream())
              .collect(
                  Collectors.toUnmodifiableMap(
                      Map.Entry::getKey, Map.Entry::getValue, Integer::sum));

  NucleotideCounter(String sequence) {
    counts =
        sequence
            .chars()
            .mapToObj(cp -> Character.valueOf((char) cp))
            .reduce(origin, accumulator, combiner);
  }

  Map<Character, Integer> nucleotideCounts() {
    return counts;
  }

  private static final <E> E second(E ignore, E updated) {
    return updated;
  }
}
