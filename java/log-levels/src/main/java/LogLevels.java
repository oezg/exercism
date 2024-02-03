public class LogLevels {
    
    /**
     * Returns a log line's message.
     * <p>
     * LogLevels.message("[ERROR]: Invalid operation")
     * // => "Invalid operation"
     */
    public static String message(String logLine) {
        return logLine.substring(indexAfterTag(logLine, "]: ")).trim();
    }

    private static int indexAfterTag(String logLine, String tagString) {
        return logLine.indexOf(tagString) + tagString.length();
    }

    /**
     * Returns a log line's log level, which should be returned in lowercase.
     * <p>
     * LogLevels.logLevel("[ERROR]: Invalid operation")
     * // => "error"
     */
    public static String logLevel(String logLine) {
        return logLine.substring(indexAfterTag(logLine, "["), logLine.indexOf("]")).toLowerCase();
    }

    /**
     * Reformats the log line, putting the message first and the log level after it in parentheses.
     * <p>
     * LogLevels.reformat("[INFO]: Operation completed")
     * // => "Operation completed (info)"
     */
    public static String reformat(String logLine) {
        return message(logLine) + " (" + logLevel(logLine) + ")";
    }
}
