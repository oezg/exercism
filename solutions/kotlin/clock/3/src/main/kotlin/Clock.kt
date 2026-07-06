data class Clock(private var state: Int) {
  constructor(hour: Int, minute: Int): this(normalize(hour * minutesInHour + minute))
  companion object {
    const val minutesInHour = 60
    val normalize: (Int) -> Int = {
      it.mod(minutesInHour * 24).let { rem -> if (rem < 0) rem + minutesInHour * 24 else rem }
    }
  }

  fun subtract(minutes: Int) = add(-minutes)

  fun add(minutes: Int) { state = normalize(state + minutes) }

  override fun toString(): String = "%02d:%02d".format(state / minutesInHour, state % minutesInHour)
}
