module MagicianInTraining exposing (..)

import Array exposing (Array)


getCard : Int -> Array Int -> Maybe Int
getCard =
    Array.get


setCard : Int -> Int -> Array Int -> Array Int
setCard =
    Array.set


addCard : Int -> Array Int -> Array Int
addCard =
    Array.push


removeCard : Int -> Array Int -> Array Int
removeCard index deck =
    let
        cardsBefore =
            Array.slice 0 index deck

        cardsAfter =
            Array.slice (index + 1) (Array.length deck) deck
    in
    Array.append cardsBefore cardsAfter


evenCardCount : Array Int -> Int
evenCardCount =
    Array.filter isEven >> Array.length


isEven : Int -> Bool
isEven n =
    modBy 2 n == 0
