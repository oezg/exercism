module Luhn exposing (valid)


valid : String -> Bool
valid input =
    let
        s =
            String.replace " " "" input

        digits =
            reverseDigits [] s

        checkSum =
            List.indexedMap luhn digits |> List.sum
    in
    String.length s > 1 && String.all Char.isDigit s && modBy 10 checkSum == 0


luhn : Int -> Int -> Int
luhn i d =
    if modBy 2 i == 1 then
        if d < 5 then
            d * 2

        else
            d * 2 - 9

    else
        d


reverseDigits : List Int -> String -> List Int
reverseDigits acc s =
    let
        zero =
            Char.toCode '0'
    in
    case String.uncons s of
        Nothing ->
            acc

        Just ( head, tail ) ->
            reverseDigits (Char.toCode head - zero :: acc) tail
