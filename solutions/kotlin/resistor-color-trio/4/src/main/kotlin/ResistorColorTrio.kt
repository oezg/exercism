import kotlin.math.pow

object ResistorColorTrio {

  fun text(vararg input: Color): String {
    val value = (input[0].ordinal * 10 + input[1].ordinal) * (1..input[2].ordinal).fold(1) {result, _ -> 10 * result}
    val unit = Unit.entries.last { unit -> value > unit.convert() }
    val newValue = value / unit.convert()
    val unitName = unit.name.lowercase()

    return "$newValue $unitName"
  }
  private fun Unit.convert(): Int {
    return 10.0.pow(ordinal * 3).toInt()
  }
}
