module SqueakyClean

open System

let transform (c: char) : string =
    if Char.IsDigit c || Char.IsWhiteSpace c then ""
    elif Char.IsUpper c then $"-{Char.ToLower c}"
    elif c = '-' then "_"
    elif 'α' <= c && c <= 'ω' then "?"
    else string c

let clean (identifier: string) : string = String.collect transform identifier
