object ArmstrongNumber {

  fun check(input: Int): Boolean {
    require(input >= 0)
    return input == armstrongSum(input)
  }

  private tailrec fun digits(n: Int, acc: List<Int> = emptyList()): List<Int> =
      if (n == 0) acc else digits(n / 10, acc + n % 10)

  private fun armstrongSum(n: Int): Int =
      digits(n).run {
        sumOf { powerOf(it)(size) }
      }

  private fun powerOf(base: Int): (Int) -> Int {
    tailrec fun go(exp: Int, acc: Int): Int = if (exp == 0) acc else go(exp - 1, acc * base)

    return { exp: Int ->
      require(exp >= 0)
      go(exp, 1)
    }
  }
}
