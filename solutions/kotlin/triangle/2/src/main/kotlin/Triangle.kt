class Triangle<out T : Number>(val a: T, val b: T, val c: T) {

    init {
        listOf(a, b, c)
            .map(Number::toDouble)
            .apply { require(all { it > 0 }) { "All sides must be positive" } }
            .apply { require(sum() > 2 * max()) { "Triangle inequality violated" } }
    }

    val isEquilateral: Boolean get() = a == b && b == c
    val isIsosceles: Boolean get() = a == b || b == c || a == c
    val isScalene: Boolean get() = !isIsosceles
}
