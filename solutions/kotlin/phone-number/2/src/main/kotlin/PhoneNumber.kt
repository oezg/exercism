class PhoneNumber(input: String) {
  val number: String = parsePhoneNumber(input)

  companion object {
    val exclusion = Regex("""[\s\p{P}]""")
    val pattern = Regex("""(\+1|1)?([2-9]\d{2}[2-9]\d{6})""")

    private fun parsePhoneNumber(phoneNumber: String): String {
      val trimmed = phoneNumber.replace(exclusion, "")
      return requireNotNull(pattern.matchEntire(trimmed)) { "Invalid phone number" }.groupValues[2]
    }
  }
}
