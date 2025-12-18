import java.util.Arrays;
import java.util.Map;
import java.util.stream.Collectors;

final class NucleotideCounter {
  enum Nucleotide {
    A,
    C,
    G,
    T;

    static Nucleotide fromInt(int codpepoint) {
      return switch ((char) codpepoint) {
        case 'A' -> A;
        case 'C' -> C;
        case 'G' -> G;
        case 'T' -> T;
        default -> throw new IllegalArgumentException();
      };
    }

    void update(int[] counts) {
      counts[ordinal()]++;
    }
  }

  private final int[] counts = new int[Nucleotide.values().length];

  NucleotideCounter(String sequence) {
    sequence.chars().mapToObj(Nucleotide::fromInt).forEach(n -> n.update(counts));
  }

  Map<Character, Integer> nucleotideCounts() {
    return Arrays.stream(Nucleotide.values())
        .collect(Collectors.toMap(n -> n.name().charAt(0), n -> counts[n.ordinal()]));
  }
}
