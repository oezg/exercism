import java.util.function.Predicate;
import java.util.regex.Pattern;

class Bob {
  static final Predicate<String> isQuestion =
      Pattern.compile(".*\\?\\s*", Pattern.DOTALL).asMatchPredicate();
  static final Predicate<String> hasUppercase = Pattern.compile("[A-Z]").asPredicate();
  static final Predicate<String> isYell =
      hasUppercase.and(Pattern.compile("[a-z]").asPredicate().negate());
  static final Predicate<String> isYellQuestion = isQuestion.and(isYell);

  String hey(String input) {
    if (input.isBlank()) return "Fine. Be that way!";
    if (isYellQuestion.test(input)) return "Calm down, I know what I'm doing!";
    if (isYell.test(input)) return "Whoa, chill out!";
    if (isQuestion.test(input)) return "Sure.";
    return "Whatever.";
  }
}
