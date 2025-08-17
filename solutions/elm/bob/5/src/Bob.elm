module Bob exposing (hey)


type Remark
    = Silence
    | YellQuestion
    | Yell
    | Question
    | AnythingElse


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


isSilence : String -> Bool
isSilence =
    String.isEmpty


isQuestion : String -> Bool
isQuestion =
    String.endsWith "?"


triage : String -> Remark
triage text =
    if isSilence text then
        Silence

    else if isShout text then
        if isQuestion text then
            YellQuestion

        else
            Yell

    else if isQuestion text then
        Question

    else
        AnythingElse


hey : String -> String
hey remark =
    case remark |> String.trimRight |> triage of
        Silence ->
            "Fine. Be that way!"

        YellQuestion ->
            "Calm down, I know what I'm doing!"

        Yell ->
            "Whoa, chill out!"

        Question ->
            "Sure."

        AnythingElse ->
            "Whatever."
