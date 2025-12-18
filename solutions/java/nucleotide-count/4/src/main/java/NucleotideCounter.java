import java.util.Arrays;
import java.util.Map;
import java.util.TreeMap;

final class NucleotideCounter {
  private static final char[] nucleotides = new char[] {'A', 'C', 'G', 'T'};
  private final int[] counts = new int[nucleotides.length];
  private final Map<Character, Integer> counter = new TreeMap<>();

  NucleotideCounter(String sequence) {
    for (int i = 0; i < sequence.length(); i++) {
      char nucleotide = sequence.charAt(i);
      int idx = Arrays.binarySearch(nucleotides, nucleotide);
      if (idx < 0) throw new IllegalArgumentException();
      counts[idx]++;
    }

    for (int i = 0; i < counts.length; i++) counter.put(nucleotides[i], counts[i]);
  }

  Map<Character, Integer> nucleotideCounts() {
    return counter;
  }
}
