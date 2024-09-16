module PythagoreanTriplet exposing (triplets)


type alias Triplet =
    ( Int, Int, Int )


triplets : Int -> List Triplet
triplets n =
    List.concatMap
        (\sumAB ->
            List.filterMap
                (\a ->
                    if a ^ 2 + (sumAB - a) ^ 2 == (n - sumAB) ^ 2 then
                        Just ( a, sumAB - a, n - sumAB )

                    else
                        Nothing
                )
                (List.range 1 (sumAB // 2))
        )
        (List.range (n // 2) (2 * n // 3))
