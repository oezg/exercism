object CryptoSquare {
  fun ciphertext(plaintext: String): String {
    val normal = plaintext.filter(Char::isLetterOrDigit).lowercase()
    if (normal.isEmpty()) return ""
    val col =
      generateSequence(1, Int::inc).firstNotNullOf { if (it * it < normal.length) null else it }
    val mtrx = normal.chunked(col)
    return buildString(col * col) {
      (0 until col).forEach { column ->
        mtrx.forEach { chunk ->
          append(chunk.getOrElse(column) { ' ' })
        }
        if (column < col - 1) append(' ')
      }
    }
  }
}
