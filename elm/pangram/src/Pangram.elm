module Pangram exposing (isPangram)


isPangram : String -> Bool
isPangram sentence =
    Char.toCode 'z'
        |> List.range (Char.toCode 'a')
        |> List.map Char.fromCode
        |> List.all (\c -> sentence |> String.toLower |> String.toList |> List.member c)
