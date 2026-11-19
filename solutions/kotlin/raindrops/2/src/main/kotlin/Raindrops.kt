object Raindrops {

  private val rules = listOf(3 to "Pling", 5 to "Plang", 7 to "Plong")

  fun convert(n: Int): String {
    return accumulate(n, 0, StringBuilder())
  }

  private tailrec fun accumulate(n: Int, index: Int, acc: StringBuilder): String {
    val (divisor, sound) = rules.getOrNull(index) ?: return acc.ifEmpty { n }.toString()
    return accumulate(n, index + 1, acc.append(if (n % divisor == 0) sound else ""))
  }
}
