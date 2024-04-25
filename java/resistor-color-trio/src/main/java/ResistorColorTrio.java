import java.util.List;

public class ResistorColorTrio {
    String label(String[] colors) {
        return new Resistance(value(colors)).toString();
    }

    private static long value(String[] colors) {
        return (10 * colorCode(colors[0]) + colorCode(colors[1])) * (long) Math.pow(10, colorCode(colors[2]));
    }

    private static final List<String> COLORS = List.of("black", "brown", "red", "orange", "yellow", "green", "blue",
            "violet", "grey", "white");

    private static int colorCode(String color) {
        return COLORS.indexOf(color);
    }
}
