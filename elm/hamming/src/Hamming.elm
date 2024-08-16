module Hamming exposing (distance)


errorMessage : String
errorMessage =
    "strands must be of equal length"


foldLeft2 : Int -> List a -> List a -> Maybe Int
foldLeft2 acc a b =
    case ( a, b ) of
        ( x :: xs, y :: ys ) ->
            Maybe.map
                (\n ->
                    if x /= y then
                        n + 1

                    else
                        n
                )
                (foldLeft2 acc xs ys)

        ( [], [] ) ->
            Just acc

        _ ->
            Nothing


distance : String -> String -> Result String Int
distance left right =
    Result.fromMaybe errorMessage (foldLeft2 0 (String.toList left) (String.toList right))
