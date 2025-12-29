import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

final class NucleotideCounter {
  private static final Map<Character, Integer> origin = Map.of('A', 0, 'C', 0, 'G', 0, 'T', 0);

  private final Map<Character, Integer> counts;

  NucleotideCounter(String sequence) {
    counts = countNucleotides(sequence);
  }

  Map<Character, Integer> nucleotideCounts() {
    return Map.copyOf(counts);
  }

  private static Map<Character, Integer> countNucleotides(String sequence) {
    var interim = new HashMap<>(origin);
    interim.putAll(
        sequence
            .chars()
            .mapToObj(cp -> (char) cp)
            .peek(NucleotideCounter::validate)
            .collect(
                Collectors.groupingBy(
                    Function.identity(), Collectors.summingInt(nucleotide -> 1))));
    return interim;
  }

  private static void validate(Character c) {
    if (!origin.containsKey(c)) throw new IllegalArgumentException("Invalid nucleotide: " + c);
  }
}
