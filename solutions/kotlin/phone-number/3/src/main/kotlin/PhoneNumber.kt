class PhoneNumber(input: String) {
  val number: String = parsePhoneNumber(input)

  companion object {
    val digitsPattern = Regex("""[2-9]\d{2}[2-9]\d{6}""")
    private fun parsePhoneNumber(phoneNumber: String): String {
      var digits = phoneNumber.filter { it.isDigit() }
      if (digits.length == 11 && digits.first() == '1')
        digits = digits.substring(1)
      if (digits.length == 10 && digits.matches(digitsPattern)) return digits
      throw IllegalArgumentException()
    }
  }
}
