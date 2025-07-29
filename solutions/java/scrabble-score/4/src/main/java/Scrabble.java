class Scrabble {
    private final String word;

    Scrabble(String word) {
        this.word = word.toLowerCase();
    }

    int getScore() {
        return word.chars().reduce(0, (acc, c) -> acc + score((char) c));
    }

    int score(char letter) {
        return switch (letter) {
            case 'a',  'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't' -> 1;
            case 'd', 'g' -> 2;
            case 'b', 'c', 'm', 'p' -> 3;
            case 'f', 'h', 'v', 'w', 'y' -> 4;
            case 'k' -> 5;
            case 'j', 'x'-> 8;
            case 'q', 'z' -> 10;
            default -> throw new IllegalArgumentException("Invalid letter: " + letter);
        };
    }
}
