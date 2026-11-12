enum class Classification {
  DEFICIENT,
  PERFECT,
  ABUNDANT,
}

fun classify(naturalNumber: Int): Classification {
  require(naturalNumber > 0)
  return when (aliquotSum(naturalNumber)) {
    in 0 until naturalNumber -> Classification.DEFICIENT
    naturalNumber -> Classification.PERFECT
    else -> Classification.ABUNDANT
  }
}

private fun aliquotSum(naturalNumber: Int) =
  (1..naturalNumber / 2).filter { naturalNumber % it == 0 }.sum()
