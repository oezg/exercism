import java.util.HashSet;
import java.util.Set;

class IsogramChecker {

  private static final Set<Character> allowed = Set.of('-', ' ');

  boolean isIsogram(String phrase) {
    Set<Character> visited = new HashSet<>();
    for (Character character : phrase.toLowerCase().toCharArray()) {
      if (visited.contains(character)) return false;

      if (!allowed.contains(character)) visited.add(character);
    }
    return true;
  }
}
