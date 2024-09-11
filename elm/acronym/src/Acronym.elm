module Acronym exposing (abbreviate)

import Regex


abbreviate : String -> String
abbreviate =
    let
        sep =
            Regex.fromString " |-" |> Maybe.withDefault Regex.never
    in
    Regex.split sep >> List.map (String.left 1 >> String.toUpper) >> String.concat
