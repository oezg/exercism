import java.util.Arrays;
import java.util.Objects;

public enum LogLevel {
    UNKNOWN(null, 0),
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
        return Arrays.stream(LogLevel.values())
                .filter(logLevel -> Objects.equals(logLevel.getLevelString(), level))
                .findFirst().orElse(UNKNOWN);
    }
}