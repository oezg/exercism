module Sieve

let primes limit =
    let rec sieve acc rest =
        match rest with
        | [] -> List.rev acc
        | head :: tail -> sieve (head :: acc) (List.except [ head * head .. head .. limit ] tail)

    sieve [] [ 2..limit ]
