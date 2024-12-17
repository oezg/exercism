let square n = n * n

let square_of_sum n =
    (n * (n + 1)) / 2 |> square

let sum_of_squares n =
    Seq.ints 1 |> Seq.take n |> Seq.fold_left (fun a b -> a + square b) 0

let difference_of_squares n =
    square_of_sum n - sum_of_squares n
