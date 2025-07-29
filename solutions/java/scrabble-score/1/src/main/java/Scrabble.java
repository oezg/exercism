import java.util.Arrays;
import java.util.function.Function;
import java.util.stream.Collectors;

class Scrabble {
    String[] letters = new String[0];

    Scrabble(String word) {
        if(!word.isEmpty()) {
            letters = word.toLowerCase().split("");
        }
    }

    int getScore() {
        return Math.toIntExact(Arrays
                .stream(letters)
                .collect(Collectors.groupingBy(Function.identity(), Collectors.counting()))
                .entrySet()
                .stream()
                .reduce(0L,
                        (acc, entry) ->
                                acc + entry.getValue() * score(entry.getKey()),
                        Long::sum));
    }

    int score(String letter) {
        return switch (letter) {
            case "a",  "e", "i", "o", "u", "l", "n", "r", "s", "t" -> 1;
            case "d", "g" -> 2;
            case "b", "c", "m", "p" -> 3;
            case "f", "h", "v", "w", "y" -> 4;
            case "k" -> 5;
            case "j", "x"-> 8;
            case "q", "z" -> 10;
            default -> throw new IllegalArgumentException("Invalid letter: " + letter);
        };
    }
}
