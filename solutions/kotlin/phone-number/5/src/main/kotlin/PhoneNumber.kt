class PhoneNumber(input: String) {
  val number: String =
    requireNotNull(
      input
        .filter { it.isDigit() }
        .run {
          when (length) {
            10 -> this
            11 -> takeIf { startsWith('1') }?.substring(1)
            else -> null
          }
        }
        ?.takeIf { it[0] != '0' && it[0] != '1' && it[3] != '0' && it[3] != '1' },
    ) {
      "Invalid phone number"
    }
}
