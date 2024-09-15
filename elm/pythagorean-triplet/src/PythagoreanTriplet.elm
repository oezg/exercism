module PythagoreanTriplet exposing (triplets)


type alias Triplet =
    ( Int, Int, Int )


triplets : Int -> List Triplet
triplets n =
    let
        z =
            n // 2

        bRange =
            List.range (ceiling <| sqrt (toFloat n / 2)) (n // 4)

        toTriplet ( x, y ) =
            let
                a =
                    x * x - y * y

                b =
                    2 * x * y

                c =
                    x * x + y * y
            in
            ( min a b, max a b, c )

        ispyth b =
            if modBy b (n // 2) == 0 then
                Just ( b, n // 2 // b )

            else
                Nothing
    in
    List.map toTriplet (List.filterMap ispyth bRange)
