module RotationalCipher exposing (rotate)


rotate : String -> Int -> String
rotate text shiftKey =
    rotateData shiftKey text


rotateFromBase : Char -> Int -> Char -> Char
rotateFromBase a shift c =
    Char.toCode a + modBy 26 (Char.toCode c - Char.toCode a + shift) |> Char.fromCode


rotateData : Int -> String -> String
rotateData shift =
    String.map
        (\c ->
            (if Char.isLower c then
                rotateFromBase 'a' shift

             else if Char.isUpper c then
                rotateFromBase 'A' shift

             else
                identity
            )
                c
        )
