class Anagram(source: String) {
    private val lowerSource: String = source.lowercase()
    private val letterCounts: Map<Char, Int> by lazy { lowerSource.groupingBy { it }.eachCount() }

    fun match(anagrams: Collection<String>): Set<String> =
        anagrams.filterTo(mutableSetOf()) { Anagram(it).matches(this) }


    private fun matches(candidate: Anagram): Boolean =
        lowerSource != candidate.lowerSource && letterCounts == candidate.letterCounts
}
