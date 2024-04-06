module EliudsEggs exposing (eggCount)


eggCount : Int -> Int
eggCount n =
    case ( n, modBy 2 n ) of
        ( 0, _ ) ->
            0

        ( _, 0 ) ->
            eggCount (n // 2)

        _ ->
            1 + eggCount (n // 2)
