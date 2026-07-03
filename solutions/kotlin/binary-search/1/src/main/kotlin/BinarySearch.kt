object BinarySearch {
  fun search(list: List<Int>, item: Int): Int {
    tailrec fun go(lower: Int = 0, upper: Int = list.lastIndex): Int =
      if (upper < lower) -1
      else
        (lower + (upper - lower) / 2).let { middle ->
          if (item < list[middle]) go(lower, middle.dec())
          else if (item > list[middle]) go(middle.inc(), upper)
          else middle
        }

    fun ko() = if (list.isEmpty() || item !in list.first()..list.last()) -1 else go()
    return ko().also { if (it < 0) throw NoSuchElementException("$item is not found") }
  }
}
