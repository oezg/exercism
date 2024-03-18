public class LogLine {
    private final LogLevel level;
    private final String message;

    public LogLevel getLogLevel() {
        return level;
    }

    private String getMessage() {
        return message;
    }

    public LogLine(String logLine) {
        message = logLine.substring(7);
        level = LogLevel.fromString(logLine.substring(1, 4));
    }

    public String getOutputForShortLog() {
        return String.format("%d:%s", level.getEncodedLevel(), getMessage());
    }
}