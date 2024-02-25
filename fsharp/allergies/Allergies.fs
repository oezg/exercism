module Allergies

open System

type Allergen =
    | Eggs = 0b1
    | Peanuts = 0b10
    | Shellfish = 0b100
    | Strawberries = 0b1000
    | Tomatoes = 0b1_0000
    | Chocolate = 0b10_0000
    | Pollen = 0b100_0000
    | Cats = 0b1000_0000

let allergicTo codedAllergies (allergen: Allergen) =
    codedAllergies ||| int allergen = codedAllergies

let list codedAllergies =
    Enum.GetValues<Allergen>()
    |> Seq.filter (allergicTo codedAllergies)
    |> List.ofSeq
