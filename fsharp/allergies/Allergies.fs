module Allergies

open System.Collections

// TODO: define the Allergen type
type Allergen =
    | Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats

let getAllergyScore =
    function
    | Eggs -> 1
    | Peanuts -> 2
    | Shellfish -> 4
    | Strawberries -> 8
    | Tomatoes -> 16
    | Chocolate -> 32
    | Pollen -> 64
    | Cats -> 128


let ba = new BitArray( 8 )

let allergicTo codedAllergies allergen = codedAllergies >= getAllergyScore allergen

let list codedAllergies = []