object Raindrops {

  private val rules = listOf(3 to "Pling", 5 to "Plang", 7 to "Plong")

  fun convert(n: Int): String {
    return rules
      .filter { n % it.first == 0 }.joinToString("", transform = Pair<Int, String>::second)
      .ifEmpty { n.toString() }
  }
}
