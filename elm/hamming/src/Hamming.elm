module Hamming exposing (distance)


distance : String -> String -> Result String Int
distance left right =
    if String.length left /= String.length right then
        Err "strands must be of equal length"

    else
        List.map2
            (\a b ->
                if a == b then
                    0

                else
                    1
            )
            (String.toList left)
            (String.toList right)
            |> List.sum
            |> Ok
