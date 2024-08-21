module Etl exposing (transform)

import Dict exposing (Dict)


transform : Dict Int (List String) -> Dict String Int
transform =
    Dict.foldl invert Dict.empty


invert : Int -> List String -> Dict String Int -> Dict String Int
invert score letters intoCollection =
    let
        inserting letter =
            Dict.insert (String.toLower letter) score
    in
    List.foldl inserting intoCollection letters
