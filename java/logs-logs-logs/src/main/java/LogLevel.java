public enum LogLevel {
    TRACE("TRC"),
    DEBUG("DBG"),
    INFO("INF"),
    WARNING("WRN"),
    ERROR("ERR"),
    FATAL("FTL"),
    UNKNOWN("");

    private final String levelString;

    public String getLevelString() {
        return levelString;
    }

    LogLevel(String level) {
        levelString = level;
    }

    public static LogLevel fromString(String level) {
        for (LogLevel logLevel : LogLevel.values()) {
            if (logLevel.getLevelString().equals(level)) {
                return logLevel;
            }
        }
        return LogLevel.UNKNOWN;
    }
}
