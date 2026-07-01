class Allergies(private val score: Int) {
    private val allergens: List<Allergen> by lazy {
        Allergen.entries.filter(::isAllergicTo)
    }

    fun getList() = allergens

    fun isAllergicTo(allergen: Allergen) = allergen.score and score != 0
}
