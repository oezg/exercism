module Hamming

let distance strand1 =
    function
    | strand2 when String.length strand2 <> String.length strand1 -> None
    | strand2 ->
        Seq.fold2 (fun state s1 s2 -> state + if s1 <> s2 then 1 else 0) 0 strand1 strand2
        |> Some
