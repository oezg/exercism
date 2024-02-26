module Hamming

let distance strand1 strand2 =
    if String.length strand1 <> String.length strand2 then
        None
    else
        Seq.fold2 (fun state s1 s2 -> state + if s1 <> s2 then 1 else 0) 0 strand1 strand2
        |> Some
