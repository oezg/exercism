object Hamming {

  fun compute(leftStrand: String, rightStrand: String): Int {
    return countDistance(leftStrand, rightStrand, 0)
  }

  tailrec fun countDistance(left: String, right: String, count: Int): Int {
    if (left.isEmpty() and right.isEmpty()) return count
    require(left.isNotEmpty() and right.isNotEmpty()) {
      "left and right strands must be of equal length"
    }
    return countDistance(
      left.substring(1),
      right.substring(1),
      count + (if (left[0] == right[0]) 0 else 1),
    )
  }
}
