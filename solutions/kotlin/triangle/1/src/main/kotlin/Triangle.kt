class Triangle<out T : Number>(val a: T, val b: T, val c: T) {

    private val aDouble = a.toDouble()
    private val bDouble = b.toDouble()
    private val cDouble = c.toDouble()

    init {
        listOf(
            aDouble + bDouble > cDouble,
            aDouble + cDouble > bDouble,
            cDouble + bDouble > aDouble
        ).apply { require(all { it }) }
    }

    val isEquilateral: Boolean = a == b && b == c
    val isIsosceles: Boolean = a == b || b == c || a == c
    val isScalene: Boolean = !isIsosceles
}
