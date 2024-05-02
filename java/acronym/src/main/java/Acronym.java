import java.util.Arrays;
import java.util.stream.Collectors;

class Acronym {
    String acronym;

    Acronym(String phrase) {
        acronym = Arrays.stream(phrase.split("[\\s-]"))
                .map(s -> s.replaceAll("[\\W_]", ""))
                .filter(s -> !s.isEmpty())
                .map(s -> s.substring(0, 1).toUpperCase())
                .collect(Collectors.joining());
    }

    String get() {
        return acronym;
    }
}
