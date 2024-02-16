module Bob

open System

let private isYell (input: string): bool = 
    input = input.ToUpper() && String.exists Char.IsUpper input
    

let response (input: string): string = 
    match input.Trim() with
    | "" -> "Fine. Be that way!"
    | input when input.EndsWith('?') && isYell input -> "Calm down, I know what I'm doing!"
    | input when input.EndsWith('?') -> "Sure."
    | input when isYell input -> "Whoa, chill out!"
    | _ -> "Whatever."
