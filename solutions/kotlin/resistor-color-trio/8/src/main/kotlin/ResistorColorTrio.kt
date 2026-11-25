object ResistorColorTrio {

  fun text(vararg input: Color): String {
    val (a, b, c) = input.map { it.ordinal }
    val value = (a * 10 + b) * pow10(c)
    val unit = Unit.entries.last { value > it.factor() }
    val newValue = value / unit.factor()
    val unitName = unit.name.lowercase()

    return "$newValue $unitName"
  }

  private fun pow10(power: Int): Long {
    tailrec fun pow(exp: Int, acc: Long): Long = if (exp == 0) acc else pow(exp - 1, acc * 10)
    return pow(power, 1)
  }

  private fun Unit.factor() = pow10(ordinal * 3)
}
