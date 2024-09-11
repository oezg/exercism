module AtbashCipher exposing (decode, encode)

import Dict
import String exposing (..)


encode : String -> String
encode =
    toLower >> decode >> chunk [] >> join " "


decode : String -> String
decode =
    toList >> List.filterMap translate >> fromList


translate : Char -> Maybe Char
translate char =
    if Char.isDigit char then
        Just char

    else
        Dict.get char table


chunk : List String -> String -> List String
chunk acc s =
    if length s <= 5 then
        List.reverse (s :: acc)

    else
        chunk (left 5 s :: acc) (dropLeft 5 s)


table : Dict.Dict Char Char
table =
    Dict.fromList (List.map2 Tuple.pair alphabet (List.reverse alphabet))


alphabet : List Char
alphabet =
    List.range (Char.toCode 'a') (Char.toCode 'z') |> List.map Char.fromCode
