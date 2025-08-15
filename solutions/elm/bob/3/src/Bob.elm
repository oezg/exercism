module Bob exposing (hey)


letters : String -> List Char
letters =
    String.toList >> List.filter Char.isAlpha


isThereAnyLetter : String -> Bool
isThereAnyLetter =
    letters >> List.isEmpty >> not


areAllLettersUpper : String -> Bool
areAllLettersUpper =
    letters >> List.all Char.isUpper


isShout : String -> Bool
isShout remark =
    isThereAnyLetter remark && areAllLettersUpper remark


isYellQuestion : String -> Bool
isYellQuestion remark =
    isShout remark && String.endsWith "?" remark


whatToSay : List ( c -> Bool, a ) -> a -> c -> a
whatToSay lisp default text =
    case lisp of
        [] ->
            default

        ( p, v ) :: rest ->
            if p text then
                v

            else
                whatToSay rest default text


hey : String -> String
hey remark =
    remark
        |> String.trimRight
        |> whatToSay
            [ ( String.isEmpty, "Fine. Be that way!" )
            , ( isYellQuestion, "Calm down, I know what I'm doing!" )
            , ( isShout, "Whoa, chill out!" )
            , ( String.endsWith "?", "Sure." )
            ]
            "Whatever."
