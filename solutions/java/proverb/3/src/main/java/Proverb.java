import java.util.stream.Collectors;
import java.util.stream.IntStream;

record Proverb(String[] words) {
  private static final String line = "For want of a %s the %s was lost.\n";
  private static final String last = "And all for the want of a %s.";

  public String recite() {
    return IntStream.range(0, words.length)
        .mapToObj(
            i ->
                i < words.length - 1
                    ? line.formatted(words[i], words[i + 1])
                    : last.formatted(words[0]))
        .collect(Collectors.joining());
  }
}
