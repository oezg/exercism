module Grains

let (|InRange|_|) n =
    if n < 1 || n > 64 then None else Some()

let square (n: int) : Result<uint64, string> =
    match n with
    | InRange -> Ok(1UL <<< (n - 1))
    | _ -> Error "square must be between 1 and 64"

let total: Result<uint64, string> =
    square 64 |> Result.map (fun n -> (n <<< 1) - 1UL)
