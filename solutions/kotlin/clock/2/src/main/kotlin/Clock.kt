class Clock(hour: Int, minute: Int) {
  private val minutesInHour = 60

  private var state: Int = 0
    set(value) {
      field = value.modulo(24 * minutesInHour)
    }

  init {
    state = hour * minutesInHour + minute
  }

  fun subtract(minutes: Int) = add(-minutes)

  fun add(minutes: Int) {
    state += minutes
  }

  override fun toString(): String =
    listOf(Int::div, Int::mod).joinToString(":") {
      it.invoke(state, minutesInHour).toString().padStart(2, '0')
    }

  override fun equals(other: Any?): Boolean = other is Clock && other.state == state
}

private fun Int.modulo(by: Int) = mod(by).let { if (it < 0) it + by else it }
