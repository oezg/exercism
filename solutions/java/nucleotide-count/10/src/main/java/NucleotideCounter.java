import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

final class NucleotideCounter {
  private static final Map<Character, Integer> origin = Map.of('A', 0, 'C', 0, 'G', 0, 'T', 0);
  private final String sequence;
  private final Map<Character, Integer> counts;

  NucleotideCounter(String sequence) {
    this.sequence = sequence;
    counts = mergeWith(countNucleotides());
  }

  Map<Character, Integer> nucleotideCounts() {
    return counts;
  }

  private Map<Character, Integer> mergeWith(Map<Character, Integer> nucleotidesInSequence) {
    return Stream.of(origin, nucleotidesInSequence)
        .flatMap(m -> m.entrySet().stream())
        .collect(Collectors.toMap(e -> e.getKey(), e -> e.getValue(), (v1, v2) -> v2));
  }

  private Map<Character, Integer> countNucleotides() {
    return sequence
        .chars()
        .mapToObj(cp -> Character.valueOf((char) cp))
        .collect(
            Collectors.groupingBy(
                c -> {
                  if (origin.containsKey(c)) return c;
                  throw new IllegalArgumentException();
                },
                Collectors.summingInt(nucleotide -> 1)));
  }
}
