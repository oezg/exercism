import java.util.HashSet;
import java.util.List;
import java.util.Set;

class GottaSnatchEmAll {

    static Set<String> newCollection(List<String> cards) {
        return Set.copyOf(cards);
    }

    static boolean addCard(String card, Set<String> collection) {
        return collection.add(card);
    }

    static boolean canTrade(Set<String> myCollection, Set<String> theirCollection) {
        return !(myCollection.containsAll(theirCollection) || myCollection.isEmpty());
    }

    static Set<String> commonCards(List<Set<String>> collections) {
        return collections.stream().reduce((acc, set) -> {
            Set<String> temp = new HashSet<>(acc);
            return temp.retainAll(set) ? temp : acc;
        }).orElse(new HashSet<String>());
    }

    static Set<String> allCards(List<Set<String>> collections) {
        return collections.stream().reduce((acc, set) -> {
            Set<String> temp = new HashSet<>(acc);
            return temp.addAll(set) ? temp : acc;
        }).orElse(new HashSet<>());
    }
}
