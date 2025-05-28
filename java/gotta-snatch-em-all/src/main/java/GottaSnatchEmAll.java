import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

class GottaSnatchEmAll {

  static Set<String> newCollection(List<String> cards) {
    return Set.copyOf(cards);
  }

  static boolean addCard(String card, Set<String> collection) {
    return collection.add(card);
  }

  static boolean canTrade(Set<String> myCollection, Set<String> theirCollection) {
    for (String card : theirCollection) {
      if (!myCollection.contains(card)) {
        for (String mycard : myCollection) {
          if (!theirCollection.contains(mycard)) {
            return true;
          }
        }
      }
    }
    return false;
  }

  static Set<String> commonCards(List<Set<String>> collections) {
    return collections.stream().reduce((acc, set) -> intersection(acc, set)).orElse(Set.of());
  }

  static Set<String> allCards(List<Set<String>> collections) {
    return collections.stream().reduce((acc, set) -> union(acc, set)).orElse(Set.of());
  }

  private static Set<String> union(Set<String> set1, Set<String> set2) {
    return Stream.concat(set1.stream(), set2.stream()).collect(Collectors.toSet());
  }

  private static Set<String> intersection(Set<String> set1, Set<String> set2) {
    return set1.stream().filter(set2::contains).collect(Collectors.toSet());
  }
}
