module LargestSeriesProduct exposing (largestProduct)


largestProduct : Int -> String -> Maybe Int
largestProduct span input =
    if span < 0 || span > String.length input then
        Nothing

    else if String.all Char.isDigit input |> not then
        Nothing

    else
        let
            series xs =
                if List.length xs < span then
                    []

                else
                    List.take span xs :: series (List.drop 1 xs)
        in
        List.maximum (List.map List.product (input |> String.foldr (\c acc -> Char.toCode c - 48 :: acc) [] |> series))
