module PhoneNumber exposing (getNumber)

import Regex


getNumber : String -> Maybe String
getNumber phoneNumber =
    let
        clean =
            String.filter Char.isDigit phoneNumber

        regex =
            Maybe.withDefault Regex.never <| Regex.fromString "^1?([2-9]\\d\\d[2-9]\\d\\d\\d\\d\\d\\d)$"
    in
    Regex.find regex clean
        |> List.head
        |> Maybe.map .submatches
        |> Maybe.andThen
            (List.head >> Maybe.withDefault Nothing)
