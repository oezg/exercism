class RotationalCipher(n: Int) {
  private val key = n.mod(ALPHABET_SIZE)

  fun encode(text: String): String = buildString(text.length) {
    text.forEach { append(rotate(it)) }
  }

  private fun rotate(char: Char): Char {
    val base = when (char) {
      in lowerLetters -> 'a'
      in upperLetters -> 'A'
      else -> return char
    }
    return base + (char - base + key).mod(ALPHABET_SIZE)
  }

  companion object {
    private const val ALPHABET_SIZE = 26
    private val lowerLetters = 'a'..'z'
    private val upperLetters = 'A'..'Z'
  }
}