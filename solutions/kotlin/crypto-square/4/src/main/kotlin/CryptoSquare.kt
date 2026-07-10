object CryptoSquare {
  fun ciphertext(plaintext: String) = buildString {
      val normal = plaintext.filter(Char::isLetterOrDigit).lowercase()
      if (normal.isEmpty()) return@buildString
      val col = generateSequence(1, Int::inc).firstNotNullOf { if (it * it < normal.length) null else it }
      val matrix = normal.chunked(col)
      (0 until col).forEach { column ->
        matrix.forEach { chunk ->
          append(chunk.getOrElse(column) { ' ' })
        }
        if (column < col - 1) append(' ')
    }
  }
}
