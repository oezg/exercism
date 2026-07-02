class Anagram(private val source: String) {
  private val letterCounts: Map<Char, Int> = histogram(source)

  fun match(anagrams: Collection<String>): Set<String> =
    anagrams.filterTo(mutableSetOf()) { matches(it) }

  private fun matches(candidate: String): Boolean =
    candidate.length == source.length && !candidate.equals(source, true) && histogram(candidate) == letterCounts

  companion object {
    private fun histogram(word: String): Map<Char, Int> = word.lowercase().groupingBy { it }.eachCount()
  }
}
