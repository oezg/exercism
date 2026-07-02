class Anagram(private val source: String) {
  private val letterCounts: Map<Char, Int> = histogram(source)

  fun match(anagrams: Collection<String>): Set<String> = anagrams.filterTo(mutableSetOf(), ::isAnagram)

  private fun isAnagram(word: String): Boolean =
    word.length == source.length && !word.equals(source, true) && histogram(word) == letterCounts

  companion object {
    private fun histogram(word: String): Map<Char, Int> = word.lowercase().groupingBy { it }.eachCount()
  }
}
