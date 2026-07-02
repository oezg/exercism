class Anagram(private val source: String) {
  private val letterCounts: Map<Char, Int> = source.histogram()

  fun match(anagrams: Collection<String>): Set<String> =
    anagrams.filterTo(mutableSetOf()) { matches(it) }

  private fun matches(candidate: String): Boolean =
    candidate.basicCheck() && letterCounts == candidate.histogram()

  private fun String.basicCheck() = length == source.length && !equals(source, true)

  companion object {
    private fun String.histogram(): Map<Char, Int> = lowercase().groupingBy { it }.eachCount()
  }
}
