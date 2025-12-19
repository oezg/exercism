import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

final class NucleotideCounter {
  private final Map<Character, Integer> counts;

  private static final Map<Character, Integer> origin = Map.of('A', 0, 'C', 0, 'G', 0, 'T', 0);

  NucleotideCounter(String sequence) {
    counts =
        sequence
            .chars()
            .mapToObj(cp -> Character.valueOf((char) cp))
            .reduce(origin, NucleotideCounter::accumulator, NucleotideCounter::combiner);
  }

  Map<Character, Integer> nucleotideCounts() {
    return counts;
  }

  private static final Map<Character, Integer> accumulator(
      Map<Character, Integer> acc, Character cur) {
    return Stream.concat(
            acc.entrySet().stream(),
            Stream.of(
                Map.entry(cur, increment(acc, cur).orElseThrow(IllegalArgumentException::new))))
        .collect(
            Collectors.toUnmodifiableMap(
                Map.Entry::getKey, Map.Entry::getValue, NucleotideCounter::second));
  }

  private static final Map<Character, Integer> combiner(
      Map<Character, Integer> left, Map<Character, Integer> right) {
    return Stream.concat(left.entrySet().stream(), right.entrySet().stream())
        .collect(
            Collectors.toUnmodifiableMap(Map.Entry::getKey, Map.Entry::getValue, Integer::sum));
  }

  private static final <E> E second(E ignore, E updated) {
    return updated;
  }

  private static final Optional<Integer> increment(Map<Character, Integer> m, Character c) {
    return m.get(c) instanceof Integer x ? Optional.of(x + 1) : Optional.empty();
  }
}
