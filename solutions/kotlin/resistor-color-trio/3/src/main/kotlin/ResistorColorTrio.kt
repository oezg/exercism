import kotlin.math.pow

object ResistorColorTrio {

  fun text(vararg input: Color): String {
    val value: Int
    val exponent: Int

    if (input[1] == Color.BLACK) {
      value = input[0].ordinal
      exponent = input[2].ordinal + 1
    } else {
      value = input[0].ordinal * 10 + input[1].ordinal
      exponent = input[2].ordinal
    }

    val unit = Unit.entries[exponent / 3]
    val newValue = value * 10.0.pow(exponent - unit.ordinal * 3).toInt()
    val unitName = unit.name.lowercase()

    return "$newValue $unitName"
  }
}
