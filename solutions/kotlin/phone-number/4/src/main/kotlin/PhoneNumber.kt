class PhoneNumber(input: String) {
  val number: String

  init {
    val digits = input.filter { it in '0'..'9' }
    number = requireNotNull(parse(digits)) { "Invalid phone number" }
  }

  companion object {
    private fun validate(tenDigitNumber: String) =
      tenDigitNumber.takeIf { it[0] !in '0'..'1' && it[3] !in '0'..'1'}

    private fun parse(digits: String) =
      when (digits.length) {
        10 -> validate(digits)
        11 -> if (digits.startsWith('1')) validate(digits.substring(1)) else null
        else -> null
      }
  }
}
