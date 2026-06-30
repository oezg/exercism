class Allergies(score: Int) {
    private val allergens = Allergen.entries.filter { score and it.score != 0 }

    fun getList(): List<Allergen> = allergens

    fun isAllergicTo(allergen: Allergen): Boolean = allergens.contains(allergen)
}
