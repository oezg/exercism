module PascalsTriangle exposing (rows)


rows : Int -> List (List Int)
rows =
    List.range 1 >> List.map row


row : Int -> List Int
row n =
    if n == 1 then
        [ 1 ]

    else
        let
            previous =
                row (n - 1)
        in
        List.map2 (+) (0 :: previous) (previous ++ [ 0 ])
