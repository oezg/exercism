module Bob

open System

let private someOrNone condition = if condition then Some() else None

let private twoPredicates (text: string) =
    not (text |> Seq.exists Char.IsLower) && (text |> Seq.exists Char.IsLetter)

let (|Silence|_|) = String.IsNullOrWhiteSpace >> someOrNone

let (|Question|_|) (text: string) =
    text.TrimEnd().EndsWith('?') |> someOrNone

let (|Yell|_|) = twoPredicates >> someOrNone

let response = function
    | Silence -> "Fine. Be that way!"
    | Yell & Question -> "Calm down, I know what I'm doing!"
    | Yell -> "Whoa, chill out!"
    | Question -> "Sure."
    | _ -> "Whatever."
