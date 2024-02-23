module Allergies

type Allergen =
    | Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats

let getAllergen =
    function
    | 1 -> Eggs
    | 2 -> Peanuts
    | 4 -> Shellfish
    | 8 -> Strawberries
    | 16 -> Tomatoes
    | 32 -> Chocolate
    | 64 -> Pollen
    | 128 -> Cats
    | _ -> failwith "Not Implemented"

let list codedAllergies =
    let rec helper lmt acc = function
        | 0 -> acc
        | num when num < lmt -> helper (lmt / 2) acc num
        | num -> helper (lmt / 2) ((getAllergen lmt) :: acc) (num - lmt)

    helper 128 [] (codedAllergies % 256)

let allergicTo codedAllergies allergen =
    List.contains allergen (list codedAllergies)