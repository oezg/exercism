import java.util.regex.Pattern;

public class LogLine {

    private final String line;

    public String getLine() {
        return line;
    }

    public LogLine(String logLine) {
        line = logLine;
    }

    public LogLevel getLogLevel() {
        var m = Pattern.compile("^\\[([A-Z]{3})\\]").matcher(getLine());
        if (m.find()) {
            return LogLevel.fromString(m.group(1));
        }
        throw new IllegalArgumentException();
    }

    public String getOutputForShortLog() {
        throw new UnsupportedOperationException("Please implement the getOutputForShortLog() method");
    }
}
