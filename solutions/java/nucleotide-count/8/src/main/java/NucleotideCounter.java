import java.util.HashMap;
import java.util.Map;

final class NucleotideCounter {
  private final Map<Character, Integer> counts;

  NucleotideCounter(String sequence) {
    counts =
        sequence
            .chars()
            .mapToObj(cp -> Character.valueOf((char) cp))
            .collect(
                () -> new HashMap<>(Map.of('A', 0, 'C', 0, 'G', 0, 'T', 0)),
                (map, nucleotide) -> {
                  if (map.containsKey(nucleotide)) map.put(nucleotide, map.get(nucleotide) + 1);
                  else throw new IllegalArgumentException();
                },
                (out, temp) ->
                    temp.entrySet()
                        .forEach(
                            entry ->
                                out.put(
                                    entry.getKey(), entry.getValue() + out.get(entry.getKey()))));
  }

  Map<Character, Integer> nucleotideCounts() {
    return counts;
  }
}
