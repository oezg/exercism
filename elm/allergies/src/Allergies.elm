module Allergies exposing (Allergy(..), isAllergicTo, toList)


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
    List.member allergen (toList score)


toList : Int -> List Allergy
toList score =
    let
        allergens =
            List.reverse
                [ Eggs
                , Peanuts
                , Shellfish
                , Strawberries
                , Tomatoes
                , Chocolate
                , Pollen
                , Cats
                ]
    in
    elm allergens [] (remainderBy 256 score)


elm allergens acc n =
    case allergens of
        [] ->
            acc

        head :: tail ->
            let
                score =
                    allergyScore head
            in
            if n < score then
                elm tail acc n

            else
                elm tail (head :: acc) (n - score)
