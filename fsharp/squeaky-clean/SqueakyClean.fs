module SqueakyClean

open System

let transform (c: char) : string =
    match c with
    | '-' -> "_"
    | ' ' -> ""
    | kebapCase when Char.IsUpper kebapCase -> $"-{(Char.ToLower kebapCase)}"
    | numeric when Char.IsDigit numeric -> ""
    | greekLower when 'α' <= greekLower && greekLower <= 'ω' -> "?"
    | _ -> string c

let clean (identifier: string) : string = String.collect transform identifier
