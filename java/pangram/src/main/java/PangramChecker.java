import java.util.function.IntPredicate;

public class PangramChecker {
  private static final String ALPHABET = "abcdefghijklmnopqrstuvwxyz";

  public boolean isPangram(String input) {
    IntPredicate foundInInputCaseInsensitive =
        c -> !(input.indexOf(c) < 0 && input.indexOf(Character.toUpperCase(c)) < 0);

    return ALPHABET.chars().allMatch(foundInInputCaseInsensitive);
  }
}
