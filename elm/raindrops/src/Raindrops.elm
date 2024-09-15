module Raindrops exposing (raindrops)


raindrops : Int -> String
raindrops number =
    let
        drop pair =
            if modBy (Tuple.first pair) number == 0 then
                Tuple.second pair

            else
                ""

        sounds =
            String.concat (List.map drop [ ( 3, "Pling" ), ( 5, "Plang" ), ( 7, "Plong" ) ])
    in
    if String.isEmpty sounds then
        String.fromInt number

    else
        sounds
