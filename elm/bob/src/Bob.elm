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


hey : String -> String
hey remark =
    let
        trimmedRemark =
            String.trimRight remark
    in
    if String.isEmpty trimmedRemark then
        "Fine. Be that way!"

    else if isShout remark && String.endsWith "?" trimmedRemark then
        "Calm down, I know what I'm doing!"

    else if isShout trimmedRemark then
        "Whoa, chill out!"

    else if String.endsWith "?" trimmedRemark then
        "Sure."

    else
        "Whatever."
