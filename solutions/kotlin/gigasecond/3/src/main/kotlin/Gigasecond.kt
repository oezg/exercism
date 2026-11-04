import java.time.LocalDate
import java.time.LocalDateTime

class Gigasecond (start: LocalDateTime) {
    constructor(start: LocalDate) : this(start = start.atStartOfDay())

    val date: LocalDateTime = start.plusSeconds(GIGASECOND)

    companion object {
        const val GIGASECOND = 1_000_000_000L
    }
}
