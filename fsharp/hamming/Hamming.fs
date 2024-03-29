module Hamming

let distance (strand1: string) (strand2: string) =
    if strand1.Length <> strand2.Length then
        None
    else
        Seq.zip strand1 strand2
        |> Seq.sumBy (fun (x, y) -> if x <> y then 1 else 0)
        |> Some
