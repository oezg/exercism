module ArmstrongNumbers

let private digits =
    Seq.unfold (fun s -> if s > 0 then Some(s % 10, s / 10) else None)

let private armstrong number =
    Seq.sumBy (fun x -> pown x (number |> float |> log10 |> ceil |> int))

let isArmstrongNumber (number: int) : bool =
    number = armstrong number (digits number)
