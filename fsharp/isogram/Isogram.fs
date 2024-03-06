module Isogram

open System

let private normalize = Seq.filter Char.IsLetter >> Seq.map Char.ToLower

let private areAllDistinct str =
    str |> set |> Set.count = (Seq.length str)

let isIsogram (str: string) = normalize str |> areAllDistinct
