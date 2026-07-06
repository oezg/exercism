class Clock(hour: Int, minute: Int) {
  private val hoursInDay= 24
  private val minutesInHour = 60
  private val limit = hoursInDay * minutesInHour

  private val canon: (Int) -> Int = { (it % limit).run { if (this < 0) plus(limit) else this } }

  private var total: Int

  init {
    total = canon(hour * minutesInHour + minute)
  }

  fun subtract(minutes: Int) = add(-minutes)

  fun add(minutes: Int) {
    total = canon(total + minutes)
  }

  override fun toString(): String =
    listOf(Int::div, Int::mod).joinToString(":") { it.invoke(total, minutesInHour).toString().padStart(2, '0') }

  override fun equals(other: Any?): Boolean = other is Clock && other.total == total
}
