module Bob

open System

let (|Silence|_|) text =
    if String.IsNullOrWhiteSpace text then Some() else None

let (|Question|_|) (text: string) =
    if text.TrimEnd().EndsWith('?') then Some() else None

let private check chars = 
    if not (Seq.isEmpty chars) && Seq.forall (fun c -> Char.IsUpper c) chars
    then Some() else None
let (|Yell|_|) (text: string) =
    text
    |> Seq.filter (fun c -> Char.IsLetter c)
    |> check 

let response = function
    | Silence -> "Fine. Be that way!"
    | Yell & Question -> "Calm down, I know what I'm doing!"
    | Yell -> "Whoa, chill out!"
    | Question -> "Sure."
    | _ -> "Whatever."
