module Isogram exposing (isIsogram)

import Set


alphabet : Set.Set Char
alphabet =
    Char.toCode 'z'
        |> List.range (Char.toCode 'a')
        |> List.map Char.fromCode
        |> Set.fromList


isIsogram : String -> Bool
isIsogram sentence =
    elm Set.empty (String.toLower sentence)


elm : Set.Set Char -> String -> Bool
elm visited sentence =
    case String.uncons sentence of
        Nothing ->
            True

        Just ( c, rest ) ->
            if Set.member c visited then
                False

            else if Set.member c alphabet then
                elm (Set.insert c visited) rest

            else
                elm visited rest
