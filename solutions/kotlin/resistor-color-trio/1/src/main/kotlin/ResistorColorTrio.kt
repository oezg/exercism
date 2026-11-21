import kotlin.math.pow

object ResistorColorTrio {

  fun text(vararg input: Color): String {
    // I want to set values (immutable) depending on a condition. I could not find a better way
    val (value, exponent) =
      if (input[1] == Color.BLACK) input[0].ordinal to input[2].ordinal + 1
      else input[0].ordinal * 10 + input[1].ordinal to input[2].ordinal
    val unit = Unit.entries[exponent / 3]

    // I could not find a better way of calculating the rest exponent.
    val newValue = value * 10.0.pow(exponent - unit.ordinal * 3)
    return "${newValue.toInt()} ${unit.name.lowercase()}"
  }
}
