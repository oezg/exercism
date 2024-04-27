module PerfectNumbers

type Classification =
    | Perfect
    | Abundant
    | Deficient


let classify n : Classification option =
    if n < 1 then
        None
    else
        let aliquotSum = [ 1 .. (n / 2) ] |> Seq.filter (fun i -> n % i = 0) |> Seq.sum

        match compare aliquotSum n with
        | 0 -> Perfect
        | 1 -> Abundant
        | _ -> Deficient
        |> Some
