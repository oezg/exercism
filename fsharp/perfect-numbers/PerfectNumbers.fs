module PerfectNumbers

type Classification =
    | Perfect
    | Abundant
    | Deficient

let aliquotSum n =
    [ 1 .. (n / 2) ] |> Seq.filter (fun i -> n % i = 0) |> Seq.sum

let classify n : Classification option =
    match n with
    | outOfRange when outOfRange < 1 -> None
    | perfect when perfect = aliquotSum n -> Some Perfect
    | abundant when abundant < aliquotSum n -> Some Abundant
    | _ -> Some Deficient
