public enum LogLevel {
    UNKNOWN("???", 0),
    TRACE("TRC", 1),
    DEBUG("DBG", 2),
    INFO("INF", 4),
    WARNING("WRN", 5),
    ERROR("ERR", 6),
    FATAL("FTL", 42);
    
    private final String levelString;
    private final int encodedLogLevel;
    
    public String getLevelString() {
        return levelString;
    }
   
    public int getEncodedLevel() {
        return encodedLogLevel;
    }

    LogLevel(String level, int encodedLevel) {
        levelString = level;
        encodedLogLevel = encodedLevel;
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