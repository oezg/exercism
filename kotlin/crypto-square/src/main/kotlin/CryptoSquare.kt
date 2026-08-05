import kotlin.math.ceil
import kotlin.math.sqrt

object CryptoSquare {
  fun ciphertext(plaintext: String) = buildString {
    val normal =
      plaintext.filter(Char::isLetterOrDigit).lowercase().apply {
        if (isEmpty()) return@buildString
      }
    val cols = ceil(sqrt(normal.length.toDouble())).toInt()
    val rows = (cols - cols * (cols - 1) / normal.length).also { ensureCapacity(it * cols) }
    (0 until cols).forEach { column ->
      (0 until rows).forEach { row ->
        append(normal.getOrElse(row * cols + column) { ' ' })
      }
      if (column < cols - 1) append(' ')
    }
  }
}
