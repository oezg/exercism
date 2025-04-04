module Allergies exposing (Allergy(..), isAllergicTo, toList)

import Bitwise
import Listx exposing (..)


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
    index allergen allergies
        |> Maybe.withDefault 0
        |> (^) 2


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergen score =
    let
        allergy =
            allergyScore allergen
    in
    Bitwise.and allergy score == allergy


toList : Int -> List Allergy
toList score =
    let
        allergic allergy =
            isAllergicTo allergy score
    in
    allergies
        |> List.filter allergic
