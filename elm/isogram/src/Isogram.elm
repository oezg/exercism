module Isogram exposing (isIsogram)

import Set


isIsogram : String -> Bool
isIsogram sentence =
    let
        clean =
            sentence
                |> String.filter Char.isAlpha
                |> String.toLower
    in
    clean
        |> String.toList
        |> Set.fromList
        |> Set.size
        |> (==) (String.length clean)
