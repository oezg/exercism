import java.util.function.Predicate;
import java.util.regex.Pattern;

final class Bob {
  private static final Predicate<String> isQuestion =
      Pattern.compile(".*\\?\\s*", Pattern.DOTALL).asMatchPredicate();
  private static final Predicate<String> hasUppercase =
      Pattern.compile("\\p{Upper}", Pattern.UNICODE_CHARACTER_CLASS).asPredicate();
  private static final Predicate<String> hasLowercase =
      Pattern.compile("\\p{Lower}", Pattern.UNICODE_CHARACTER_CLASS).asPredicate();
  private static final Predicate<String> isYell = hasUppercase.and(hasLowercase.negate());
  private static final Predicate<String> isYellQuestion = isQuestion.and(isYell);

  String hey(String input) {
    if (input.isBlank()) return "Fine. Be that way!";
    if (isYellQuestion.test(input)) return "Calm down, I know what I'm doing!";
    if (isYell.test(input)) return "Whoa, chill out!";
    if (isQuestion.test(input)) return "Sure.";
    return "Whatever.";
  }
}
