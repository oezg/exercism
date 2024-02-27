module Pangram

open System

let isPangram (input: string) : bool =
    let letters = "abcdefghijklmnopqrstuvwxyz"
    let control = Array.init letters.Length (fun _ -> false)

    input
    |> Seq.filter Char.IsAsciiLetter
    |> Seq.map Char.ToLower
    |> Seq.distinct
    |> Seq.map letters.IndexOf
    |> Seq.iter (fun i -> control[i] <- true)

    Array.forall id control
