module SumOfMultiples exposing (sumOfMultiples)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    List.range 1 (limit - 1)
        |> List.foldl
            (\n acc ->
                let
                    isMultiple =
                        List.any (\d -> modBy d n == 0) divisors
                in
                if isMultiple then
                    acc + n

                else
                    acc
            )
            0
