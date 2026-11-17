class PhoneNumber(input: String){
    val number: String = validate(input)

    companion object {
        fun validate(phoneNumber: String): String {
            val exclusion = Regex("[\\s\\p{P}&&[^+]]")
            val trimmed = phoneNumber.replace(exclusion, "")
            val pattern = Regex("(\\+1|1)?([2-9]\\d\\d[2-9]\\d\\d\\d\\d\\d\\d)")
            if (!pattern.matches(trimmed))
                throw IllegalArgumentException()
            return pattern.find(trimmed)!!.groupValues[2]
        }
    }
}