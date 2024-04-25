import java.util.List;

class ResistorColorTrio {
    String label(String[] colors) {
        var value1 = value(colors);
        var value2 = value1 * (long) Math.pow(10, colorCode(colors[2]));
        var prefixes = List.of("giga", "mega", "kilo", "");
        var exponents = List.of(1_000_000_000, 1_000_000, 1_000, 1);
        for (int i = 0; i < prefixes.size(); i++) {
            if (value2 >= exponents.get(i)) {
                return String.format("%d %sohms", value2 / exponents.get(i), prefixes.get(i));
            }
        }
        return "0 ohms";
    }

    private static int value(String[] colors) {
        return 10 * colorCode(colors[0]) + colorCode(colors[1]);
    }

    private static final List<String> COLORS = List.of("black", "brown", "red", "orange", "yellow", "green", "blue",
            "violet", "grey", "white");

    private static int colorCode(String color) {
        return COLORS.indexOf(color);
    }
}
