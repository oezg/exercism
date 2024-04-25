type
  Allergen* = enum
    Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats
  MyAllergens = set[Allergen]

proc allergies*(score: int): set[Allergen] =
  cast[MyAllergens](score)

proc isAllergicTo*(score: int, allergen: Allergen): bool =
  allergen in allergies(score)
