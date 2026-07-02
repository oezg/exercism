class Anagram(source: String) {
  private val len = source.length
  private val lowerSource: String = source.lowercase()
  private val letterCounts: Map<Char, Int> by lazy(LazyThreadSafetyMode.NONE) {
    lowerSource.groupingBy { it }.eachCount()
  }

  fun match(anagrams: Collection<String>): Set<String> =
    anagrams.filterTo(mutableSetOf()) { matches(it) }


  private fun matches(candidate: String): Boolean =
    len == candidate.length && candidate.lowercase().run {
      this != lowerSource && letterCounts == groupingBy { it }.eachCount()
    }
}
