import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

final class NucleotideCounter {
  private static final Map<Character, Integer> origin;

  static {
    origin = Map.of('A', 0, 'C', 0, 'G', 0, 'T', 0);
  }

  private final Map<Character, Integer> counts;

  NucleotideCounter(String sequence) {
    counts = mergeWith(countNucleotides(sequence));
  }

  Map<Character, Integer> nucleotideCounts() {
    return counts;
  }

  private static Map<Character, Integer> mergeWith(Map<Character, Integer> nucleotidesInSequence) {
    return Stream.of(origin, nucleotidesInSequence)
        .flatMap(m -> m.entrySet().stream())
        .collect(Collectors.toMap(e -> e.getKey(), e -> e.getValue(), (v1, v2) -> v2));
  }

  private static Map<Character, Integer> countNucleotides(String sequence) {
    return sequence
        .chars()
        .mapToObj(cp -> (char) cp)
        .peek(NucleotideCounter::validate)
        .collect(
            Collectors.groupingBy(Function.identity(), Collectors.summingInt(nucleotide -> 1)));
  }

  private static void validate(Character c) {
    if (!origin.containsKey(c)) throw new IllegalArgumentException("Invalid nucleotide: " + c);
  }
}
