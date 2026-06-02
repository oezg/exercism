data class Year(val year: Int) {

    val isLeap = year and 3 == 0 && !((year shr 2) % 25 == 0 && (year shr 4) % 25 != 0)
}
