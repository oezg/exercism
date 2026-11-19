object Raindrops {

  private val rules = listOf(3 to "Pling", 5 to "Plang", 7 to "Plong")

  fun convert(n: Int): String = accumulate(n, 0, StringBuilder()).ifEmpty { n }.toString()

  private tailrec fun accumulate(n: Int, index: Int, acc: StringBuilder): StringBuilder {
    val (divisor, sound) = rules.getOrNull(index) ?: return acc
    if (n % divisor == 0) acc.append(sound)
    return accumulate(n, index + 1, acc)
  }
}
