module SumOfMultiples exposing (sumOfMultiples)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    let
        uniqueMultiples divisor acc =
            List.range 1 ((limit - 1) // divisor)
                |> List.map ((*) divisor)
                |> List.filter (\multiple -> not (List.member multiple acc))
                |> List.append acc
    in
    List.foldl uniqueMultiples [] divisors |> List.sum
