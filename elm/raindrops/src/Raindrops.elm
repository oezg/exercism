module Raindrops exposing (raindrops)

import Dict


raindrops : Int -> String
raindrops number =
    let
        multiple m =
            remainderBy m number == 0

        result =
            Dict.fromList [ ( 3, "i" ), ( 5, "a" ), ( 7, "o" ) ]
                |> Dict.foldl
                    (\m c acc ->
                        if multiple m then
                            acc ++ "Pl" ++ c ++ "ng"

                        else
                            acc
                    )
                    ""
    in
    if String.isEmpty result then
        String.fromInt number

    else
        result
