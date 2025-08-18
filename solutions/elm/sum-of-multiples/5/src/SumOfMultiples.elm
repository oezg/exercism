module SumOfMultiples exposing (sumOfMultiples)

import Set


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    let
        uniqueMultiples divisor uniques =
            if divisor <= 0 then
                uniques

            else
                List.range 1 ((limit - 1) // divisor)
                    |> List.map ((*) divisor)
                    |> List.foldl Set.insert uniques
    in
    List.foldl uniqueMultiples Set.empty divisors
        |> Set.foldl (+) 0
