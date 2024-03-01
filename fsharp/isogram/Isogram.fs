module Isogram

open System

let isIsogram (str: string) =
    let letters = Seq.filter Char.IsAsciiLetter str |> Seq.map Char.ToLower
    0 = Seq.compareWith compare letters (Seq.distinct letters)
