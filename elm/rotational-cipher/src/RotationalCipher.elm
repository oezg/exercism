module RotationalCipher exposing (rotate)


rotate : String -> Int -> String
rotate text shiftKey =
    let
        rotation c =
            let
                elm a =
                    a + modBy 26 (Char.toCode c - a + shiftKey) |> Char.fromCode
            in
            if Char.isLower c then
                elm (Char.toCode 'a')

            else if Char.isUpper c then
                elm (Char.toCode 'A')

            else
                c
    in
    String.map rotation text
