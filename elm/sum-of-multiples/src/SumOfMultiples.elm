module SumOfMultiples exposing (sumOfMultiples)

import Set


multiples : Int -> Int -> List Int
multiples n limit =
    (limit - 1)
        // n
        |> List.range 1
        |> List.map (\x -> x * n)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    List.concatMap (\d -> multiples d limit) divisors
        |> Set.fromList
        |> Set.toList
        |> List.sum
