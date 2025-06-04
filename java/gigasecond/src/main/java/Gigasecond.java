import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Gigasecond {
  private static final Duration GIGASECOND = Duration.ofSeconds(1_000_000_000);
  private LocalDateTime dateTime;

  public Gigasecond(LocalDate moment) {
    this(moment.atStartOfDay());
  }

  public Gigasecond(LocalDateTime moment) {
    dateTime = moment.plus(GIGASECOND);
  }

  public LocalDateTime getDateTime() {
    return dateTime;
  }
}
