import java.util.HashMap;
import java.util.Map;

final class NucleotideCounter {
  private final Map<Character, Integer> counts =
      new HashMap<>(Map.of('A', 0, 'C', 0, 'G', 0, 'T', 0));

  NucleotideCounter(String sequence) {
    for (int i = 0; i < sequence.length(); i++)
      counts.compute(
          sequence.charAt(i),
          (_nucleotide, count) -> {
            if (count == null) throw new IllegalArgumentException();
            return count + 1;
          });
  }

  Map<Character, Integer> nucleotideCounts() {
    return counts;
  }
}
