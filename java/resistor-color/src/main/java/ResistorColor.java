import java.util.List;

class ResistorColor {
    private static final List<String> _colors = List.of("black", "brown", "red", "orange", "yellow", "green", "blue",
            "violet", "grey", "white");

    int colorCode(String color) {
        return _colors.indexOf(color);
    }

    String[] colors() {
        return _colors.toArray(new String[0]);
    }
}
