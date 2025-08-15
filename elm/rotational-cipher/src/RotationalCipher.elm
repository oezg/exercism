module RotationalCipher exposing (rotate)


lowerA : Int
lowerA =
    'a' |> Char.toCode


upperA : Int
upperA =
    'A' |> Char.toCode


rotateFrom : Int -> Int -> Char -> Char
rotateFrom base shift c =
    base + modBy 26 (Char.toCode c - base + shift) |> Char.fromCode


rotate : String -> Int -> String
rotate text shiftKey =
    String.map
        (\c ->
            if Char.isLower c then
                rotateFrom lowerA shiftKey c

            else if Char.isUpper c then
                rotateFrom upperA shiftKey c

            else
                c
        )
        text
