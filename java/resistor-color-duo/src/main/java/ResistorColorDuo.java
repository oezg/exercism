import java.util.List;

class ResistorColorDuo {
    int value(String[] colors) {
        return 10 * colorCode(colors[0]) + colorCode(colors[1]);
    }

    private static final List<String> COLORS = List.of("black", "brown", "red", "orange", "yellow", "green", "blue",
            "violet", "grey", "white");

    private static int colorCode(String color) {
        return COLORS.indexOf(color);
    }
}
