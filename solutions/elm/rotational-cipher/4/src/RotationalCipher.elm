module RotationalCipher exposing (rotate)


lowerA : Int
lowerA =
    'a' |> Char.toCode


upperA : Int
upperA =
    'A' |> Char.toCode


rotateShift : Int -> Int -> Char -> Char
rotateShift shift =
    \base c ->
        base + modBy 26 (Char.toCode c - base + shift) |> Char.fromCode


rotate : String -> Int -> String
rotate text shiftKey =
    let
        rotateFrom =
            rotateShift shiftKey
    in
    String.map
        (\c ->
            if Char.isLower c then
                rotateFrom lowerA c

            else if Char.isUpper c then
                rotateFrom upperA c

            else
                c
        )
        text
