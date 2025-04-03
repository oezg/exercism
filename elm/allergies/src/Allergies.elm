module Allergies exposing (Allergy(..), isAllergicTo, toList)

import Bitwise


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


allergyScore : Allergy -> Int
allergyScore allergen =
    case allergen of
        Eggs ->
            1

        Peanuts ->
            2

        Shellfish ->
            4

        Strawberries ->
            8

        Tomatoes ->
            16

        Chocolate ->
            32

        Pollen ->
            64

        Cats ->
            128


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
        allergic =
            \allergy -> isAllergicTo allergy score
    in
    [ Eggs
    , Peanuts
    , Shellfish
    , Strawberries
    , Tomatoes
    , Chocolate
    , Pollen
    , Cats
    ]
        |> List.filter allergic
