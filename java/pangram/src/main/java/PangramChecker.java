import java.util.Collections;
import java.util.Set;
import java.util.stream.Collectors;

public class PangramChecker {
  private static final String alphabet = "abcdefghijklmnopqrstuvwxyz";
  private static final Set<Character> letters = setOfCharacters(alphabet);

  public boolean isPangram(String input) {
    return setOfCharacters(input.toLowerCase()).containsAll(letters);
  }

  private static Set<Character> setOfCharacters(String input) {
    return Collections.unmodifiableSet(
        input.chars().mapToObj(c -> (char) c).collect(Collectors.toSet()));
  }
}
