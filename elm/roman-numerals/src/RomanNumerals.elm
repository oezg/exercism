module RomanNumerals exposing (toRoman)


toRoman : Int -> String
toRoman =
    String.fromInt
        >> String.foldr (\c ( i, s ) -> ( i + 1, roma i c ++ s )) ( 0, "" )
        >> Tuple.second


roma : Int -> Char -> String
roma tensPower arabcDigit =
    case ( tensPower, arabcDigit ) of
        ( 0, '1' ) ->
            "I"

        ( 0, '2' ) ->
            "II"

        ( 0, '3' ) ->
            "III"

        ( 0, '4' ) ->
            "IV"

        ( 0, '5' ) ->
            "V"

        ( 0, '6' ) ->
            "VI"

        ( 0, '7' ) ->
            "VII"

        ( 0, '8' ) ->
            "VIII"

        ( 0, '9' ) ->
            "IX"

        ( 1, '1' ) ->
            "X"

        ( 1, '2' ) ->
            "XX"

        ( 1, '3' ) ->
            "XXX"

        ( 1, '4' ) ->
            "XL"

        ( 1, '5' ) ->
            "L"

        ( 1, '6' ) ->
            "LX"

        ( 1, '7' ) ->
            "LXX"

        ( 1, '8' ) ->
            "LXXX"

        ( 1, '9' ) ->
            "XC"

        ( 2, '1' ) ->
            "C"

        ( 2, '2' ) ->
            "CC"

        ( 2, '3' ) ->
            "CCC"

        ( 2, '4' ) ->
            "CD"

        ( 2, '5' ) ->
            "D"

        ( 2, '6' ) ->
            "DC"

        ( 2, '7' ) ->
            "DCC"

        ( 2, '8' ) ->
            "DCCC"

        ( 2, '9' ) ->
            "CM"

        ( 3, '1' ) ->
            "M"

        ( 3, '2' ) ->
            "MM"

        ( 3, '3' ) ->
            "MMM"

        _ ->
            ""
