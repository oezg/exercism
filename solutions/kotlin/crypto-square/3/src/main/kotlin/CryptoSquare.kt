import kotlin.math.ceil
import kotlin.math.sqrt

object CryptoSquare {
  fun ciphertext(plaintext: String) = buildString {
      val normal = plaintext.filter(Char::isLetterOrDigit).lowercase()
      val col = ceil(sqrt(normal.length.toDouble())).toInt()
      (0 until col).forEach { column ->
        normal.chunked(col).forEach { chunk ->
          append(chunk.getOrElse(column) { ' ' })
        }
        if (column < col - 1) append(' ')
    }
  }
}
