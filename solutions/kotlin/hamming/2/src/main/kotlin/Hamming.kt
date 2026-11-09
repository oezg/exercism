object Hamming {

  fun compute(leftStrand: String, rightStrand: String): Int {
    require(leftStrand.length == rightStrand.length) {
      "left and right strands must be of equal length"
    }
    val length = leftStrand.length

    tailrec fun countDistance(index: Int, count: Int): Int {
      return if (index == length) count
      else {
        val distance = if (leftStrand[index] == rightStrand[index]) 0 else 1
        countDistance(index = index + 1, count = count + distance)
      }
    }
    return countDistance(index = 0, count = 0)
  }
}
