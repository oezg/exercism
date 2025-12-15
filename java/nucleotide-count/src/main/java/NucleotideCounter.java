import java.util.HashMap;
import java.util.Map;
import java.util.function.Predicate;
import java.util.regex.Pattern;

record NucleotideCounter(String sequence) {
  private static final Predicate<String> isValid = Pattern.compile("[ACGT]*").asMatchPredicate();

  NucleotideCounter {
    if (!isValid.test(sequence)) throw new IllegalArgumentException();
  }

  Map<Character, Integer> nucleotideCounts() {
    Map<Character, Integer> counter = new HashMap<>(Map.of('A', 0, 'C', 0, 'G', 0, 'T', 0));
    sequence.chars().mapToObj(i -> (char) i).forEach(c -> counter.merge(c, 1, Integer::sum));
    return counter;
  }
}
