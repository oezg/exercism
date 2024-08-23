module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)


squareOfSum : Int -> Int
squareOfSum n =
    let
        sum =
            n * (n + 1) // 2
    in
    sum * sum


sumOfSquares : Int -> Int
sumOfSquares n =
    List.range 1 n |> List.map (\i -> i ^ 2) |> List.sum


difference : Int -> Int
difference n =
    sumOfSquares n - squareOfSum n |> abs
