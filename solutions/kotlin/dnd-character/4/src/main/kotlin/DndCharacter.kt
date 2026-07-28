import java.lang.Math.floorDiv

class DndCharacter {

  val strength: Int = ability()
  val dexterity: Int = ability()
  val constitution: Int = ability()
  val intelligence: Int = ability()
  val wisdom: Int = ability()
  val charisma: Int = ability()
  val hitpoints: Int = modifier(constitution) + 10

  companion object {

    fun ability() = List(4) { (1..6).random() }.run { sum() - min() }

    fun modifier(score: Int) = floorDiv((score - 10), 2)
  }
}
