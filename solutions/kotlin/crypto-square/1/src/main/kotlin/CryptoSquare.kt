object CryptoSquare {

  fun ciphertext(plaintext: String): String =
    with(plaintext.filter(Char::isLetterOrDigit).lowercase()) {
      if (isEmpty()) ""
      else {
        val (row, col) =
          generateSequence(1, Int::inc).firstNotNullOf {
            if (it * it >= length) it to it else if (it * it + it >= length) it to it + 1 else null
          }
        with(padEnd(row * col, ' ').chunked(col)) {
          first().indices.joinToString(" ") { c ->
            indices.map { r -> get(r)[c] }.joinToString("")
          }
        }
      }
    }
}
