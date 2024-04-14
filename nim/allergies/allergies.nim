type
  Allergen* = enum
    Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats
  MyAllergens = set[Allergen]


proc isAllergicTo*(score: int, allergen: Allergen): bool =
  let mask = 1 shl ord(allergen)
  result = (score and mask) != 0

proc allergies*(score: int): set[Allergen] =
  cast[MyAllergens](score)
