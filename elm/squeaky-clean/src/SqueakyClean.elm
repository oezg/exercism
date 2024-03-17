module SqueakyClean exposing (clean, clean1, clean2, clean3, clean4)

import Regex


clean1 : String -> String
clean1 =
    String.replace " " "_"


clean2 : String -> String
clean2 =
    clean1
        >> controlToLabel [ "\n", "\u{000D}", "\t" ]


controlToLabel : List String -> String -> String
controlToLabel acc str =
    case acc of
        [] ->
            str

        head :: tail ->
            controlToLabel tail (String.replace head "[CTRL]" str)


clean3 : String -> String
clean3 =
    let
        rgx =
            Maybe.withDefault Regex.never (Regex.fromString "-(.)")

        submatch m =
            Maybe.withDefault "" (Maybe.withDefault Nothing (List.head m.submatches))

        kabapCase =
            Regex.replace rgx (\m -> String.toUpper (submatch m))
    in
    clean2 >> kabapCase


clean4 : String -> String
clean4 =
    clean3 >> String.filter (Char.isDigit >> not)


clean : String -> String
clean =
    clean4 >> String.filter (\chr -> chr < 'α' || chr > 'ω')
