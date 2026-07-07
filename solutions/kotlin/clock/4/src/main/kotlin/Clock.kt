class Clock(hour: Int, minute: Int) {
  private var state: Int = 0
    set(value) {
      field = value.mod(24 * 60)
    }

  init {
    state = hour * 60 + minute
  }

  fun subtract(minutes: Int) = add(-minutes)

  fun add(minutes: Int) {
    state += minutes
  }

  override fun toString(): String = "%02d:%02d".format(state / 60, state % 60)

  override fun equals(other: Any?): Boolean = other is Clock && other.state == state
}
