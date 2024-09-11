module Series exposing (slices)

import Array


slices : Int -> String -> Result String (List (List Int))
slices size input =
    let
        digits =
            String.split "" input |> List.filterMap String.toInt |> Array.fromList

        slice index =
            Array.slice index (index + size) digits |> Array.toList

        length =
            Array.length digits
    in
    if String.isEmpty input then
        Err "series cannot be empty"

    else if size < 0 then
        Err "slice length cannot be negative"

    else if size == 0 then
        Err "slice length cannot be zero"

    else if size > length then
        Err "slice length cannot be greater than series length"

    else
        Ok (List.map slice (List.range 0 (length - size)))
