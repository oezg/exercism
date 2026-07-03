class Anagram(private val source: String) {
  private val letterCounts: Map<Char, Int> = source.histogram()

  fun match(anagrams: Collection<String>): Set<String> = anagrams.filterTo(mutableSetOf(), ::isAnagram)

  private fun isAnagram(word: String): Boolean = with(word) {
    length == source.length && !equals(source, true) && histogram() == letterCounts
  }
}

private fun String.histogram() = filter(Char::isLetter).groupingBy { it.lowercaseChar() }.eachCount()