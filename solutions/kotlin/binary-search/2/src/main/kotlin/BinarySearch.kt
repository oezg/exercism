object BinarySearch {
  fun search(list: List<Int>, item: Int): Int {
    tailrec fun go(lower: Int = 0, upper: Int = list.lastIndex): Int? =
      if (upper < lower) null
      else {
        val middle = lower + (upper - lower) / 2
        if (item < list[middle]) go(lower, middle.dec())
        else if (item > list[middle]) go(middle.inc(), upper)
        else middle
    }
    return go() ?: throw NoSuchElementException()
  }
}
