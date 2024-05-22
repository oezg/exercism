module Etl

open System
open System.Collections.Generic


let transform (scoresWithLetters: Map<int, char list>) : Map<char, int> =
    let mutableDictionary = Dictionary<char, int>()

    for KeyValue(score, letterList) in scoresWithLetters do
        for letter in letterList do
            let letter' = Char.ToLower letter

            if mutableDictionary.ContainsKey letter' then
                failwithf "Letter '%c' is assigned more than one score" letter

            mutableDictionary.Add(Char.ToLower letter, score)

    mutableDictionary |> Seq.map (fun kvp -> kvp.Key, kvp.Value) |> Map.ofSeq
