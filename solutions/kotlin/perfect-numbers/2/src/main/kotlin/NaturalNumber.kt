enum class Classification {
  DEFICIENT,
  PERFECT,
  ABUNDANT,
}

fun classify(naturalNumber: Int): Classification {
  require(naturalNumber > 0)

  val aliquotSum =
    (1..naturalNumber / 2).fold(0) { acc, n ->
      val newAcc = if (naturalNumber % n == 0) acc + n else acc
      if (newAcc > naturalNumber) return Classification.ABUNDANT else newAcc
    }

  return if (aliquotSum < naturalNumber) Classification.DEFICIENT else Classification.PERFECT
}
