class RotationalCipher(n: Int) {
  private val key = n % LIMIT

  fun encode(text: String): String = buildString {
    text.forEach { append(rotate(it)) }
  }

  private fun rotate(char: Char) =
    when (char) {
      in lowerLetters -> 'a'.code + (char - 'a' + key) % LIMIT
      in upperLetters -> 'A'.code + (char - 'A' + key) % LIMIT
      else -> char.code
    }.toChar()

  companion object {
    private const val LIMIT = 26
    private val lowerLetters = 'a'..'z'
    private val upperLetters = 'A'..'Z'

  }
}
