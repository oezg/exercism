class RotationalCipher(private val key: Int) {

  private val lowerLetters = 'a'..'z'
  private val upperLetters = 'A'..'Z'

  fun encode(text: String): String = buildString {
    text.forEach { append(rotate(it)) }
  }

  private fun rotate(char: Char) =
    when (char) {
      in lowerLetters -> 'a'.code + (char - 'a' + key) % 26
      in upperLetters -> 'A'.code + (char - 'A' + key) % 26
      else -> char.code
    }.toChar()
}
