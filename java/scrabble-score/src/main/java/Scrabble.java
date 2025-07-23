import java.util.Arrays;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

class Scrabble {

    Map<String, Long> freq;
    Scrabble(String word) {
        freq = Arrays.stream(word.toLowerCase().split("")).collect(Collectors.groupingBy(Function.identity(), Collectors.counting()));

    }

    int getScore() {
        return 1;
    }

}
