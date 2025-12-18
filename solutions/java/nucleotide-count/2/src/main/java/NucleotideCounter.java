import java.util.HashMap;
import java.util.Map;

final class NucleotideCounter {
  private final Map<Character, Integer> counts =
      new HashMap<>(Map.of('A', 0, 'C', 0, 'G', 0, 'T', 0));

  NucleotideCounter(String sequence) {
    for (char nucleotide : sequence.toCharArray())
      switch (nucleotide) {
        case 'A', 'C', 'G', 'T' -> counts.put(nucleotide, counts.get(nucleotide) + 1);
        default -> throw new IllegalArgumentException();
      }
  }

  Map<Character, Integer> nucleotideCounts() {
    return counts;
  }
}
