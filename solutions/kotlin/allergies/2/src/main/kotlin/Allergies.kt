class Allergies(private val score: Int) {
    fun getList() = Allergen.entries.filter(::isAllergicTo)

    fun isAllergicTo(allergen: Allergen) = allergen.score and score != 0
}
