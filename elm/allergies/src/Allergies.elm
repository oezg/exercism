module Allergies exposing (Allergy(..), isAllergicTo, toList)

import Bitwise
import Listx


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


allergies : List Allergy
allergies =
    [ Eggs
    , Peanuts
    , Shellfish
    , Strawberries
    , Tomatoes
    , Chocolate
    , Pollen
    , Cats
    ]


allergyScore : Allergy -> Int
allergyScore allergen =
    case Listx.index allergen allergies of
        Nothing ->
            0

        Just idx ->
            Bitwise.shiftLeftBy idx 1


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergen score =
    Bitwise.and (allergyScore allergen) score > 0


toList : Int -> List Allergy
toList score =
    List.filter (\arg -> isAllergicTo arg score) allergies
