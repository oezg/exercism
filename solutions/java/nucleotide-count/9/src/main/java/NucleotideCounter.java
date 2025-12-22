import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

final class NucleotideCounter {
  private final Map<Character, Integer> counts =
      new HashMap<>(Map.of('A', 0, 'C', 0, 'G', 0, 'T', 0));

  NucleotideCounter(String sequence) {
    counts.putAll(
        sequence
            .chars()
            .mapToObj(cp -> Character.valueOf((char) cp))
            .collect(
                Collectors.groupingBy(
                    c -> {
                      if (counts.containsKey(c)) return c;
                      throw new IllegalArgumentException();
                    },
                    Collectors.summingInt(nucleotide -> 1))));
  }

  Map<Character, Integer> nucleotideCounts() {
    return counts;
  }
}
