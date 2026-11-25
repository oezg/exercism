object ResistorColorTrio {

  fun text(vararg input: Color): String {
    val (a, b, c) = input.map { it.ordinal }
    val value = (a * 10 + b) * c.pow10()
    val unit = Unit.entries.last { value > it.factor() }
    val newValue = value / unit.factor()
    val unitName = unit.name.lowercase()

    return "$newValue $unitName"
  }

  private tailrec fun Int.pow(exp: Int, acc: Long = 1): Long =
    if (exp == 0) acc else pow(exp - 1, acc * this)

  private fun Int.pow10() = 10.pow(this)

  private fun Unit.factor() = (ordinal * 3).pow10()
}
