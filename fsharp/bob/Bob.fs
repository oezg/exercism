module Bob

open System

let private someOrNone condition = if condition then Some() else None

let noLowerExists = Seq.exists Char.IsLower >> not

let someLetterExists = Seq.exists Char.IsLetter

let private allLettersUpper (text: string) =
    noLowerExists text && someLetterExists text

let (|Silence|_|) = String.IsNullOrWhiteSpace >> someOrNone

let (|Question|_|) (text: string) =
    text.TrimEnd().EndsWith('?') |> someOrNone

let (|Yell|_|) = allLettersUpper >> someOrNone

let response =
    function
    | Silence -> "Fine. Be that way!"
    | Yell & Question -> "Calm down, I know what I'm doing!"
    | Yell -> "Whoa, chill out!"
    | Question -> "Sure."
    | _ -> "Whatever."
