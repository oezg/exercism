let square n = n * n

let square_of_sum n = 
    n * (n + 1) / 2 |> square

let sum_of_squares n =
    List.init (n + 1) square |> List.fold_left (+) 0

let difference_of_squares n =
    square_of_sum n - sum_of_squares n
