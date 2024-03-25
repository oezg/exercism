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


allTrue : List (b -> Bool) -> b -> Bool
allTrue predicates arg =
    List.all (\f -> f arg) predicates


isQuestion : String -> Bool
isQuestion =
    String.trimRight
        >> String.endsWith "?"


isShout : String -> Bool
isShout =
    allTrue [ isThereAnyLetter, areAllLettersUpper ]


isSilence : String -> Bool
isSilence =
    String.trim >> String.isEmpty


isYellQuestion : String -> Bool
isYellQuestion =
    allTrue [ isShout, isQuestion ]


hey : String -> String
hey remark =
    if isSilence remark then
        "Fine. Be that way!"

    else if isYellQuestion remark then
        "Calm down, I know what I'm doing!"

    else if isShout remark then
        "Whoa, chill out!"

    else if isQuestion remark then
        "Sure."

    else
        "Whatever."
