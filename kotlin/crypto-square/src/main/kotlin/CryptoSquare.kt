import kotlin.math.ceil
import kotlin.math.sqrt

object CryptoSquare {
  fun ciphertext(plaintext: String) = buildString {
    val normal = plaintext.filter(Char::isLetterOrDigit).lowercase()
    val cols = ceil(sqrt(normal.length.toDouble())).toInt()
    (0 until cols).forEach { column ->
      (0 until cols - cols * (cols - 1) / normal.length).forEach { row ->
        append(normal.getOrElse(row * cols + column) { ' ' })
      }
      if (column < cols - 1) append(' ')
    }
  }
}
