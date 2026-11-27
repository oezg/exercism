class RotationalCipher(val n: Int) {

  fun encode(text: String): String = buildString {
    text.forEach { append(rotate(it)) }
  }

  private fun rotate(ch: Char) =
    when (ch) {
      in 'a'..'z' -> 'a'.code + (ch - 'a' + n) % 26
      in 'A'..'Z' -> 'A'.code + (ch - 'A' + n) % 26
      else -> ch.code
    }.toChar()

}
