module Hamming

let distance strand1 strand2 =
    if String.length strand1 <> String.length strand2 then
        None
    else
        Seq.zip strand1 strand2
        |> Seq.sumBy (fun (x, y) -> if x <> y then 1 else 0)
        |> Some
