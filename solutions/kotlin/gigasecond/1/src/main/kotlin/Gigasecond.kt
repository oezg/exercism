import java.time.LocalDate
import java.time.LocalDateTime

class Gigasecond (private val start: LocalDateTime) {
    constructor(start: LocalDate) : this(start = start.atStartOfDay())

    val date: LocalDateTime = start.plusSeconds(1_000_000_000)
}
