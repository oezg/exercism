data class Year(val year: Int) {

    val isLeap = year and 3 == 0 && !(year % 100 == 0 && year % 400 != 0)
}
