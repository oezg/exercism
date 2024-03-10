module Sieve

let primes limit =
    let sieve = Array.init (limit + 1) (fun i -> if i < 2 then false else true)

    for i = 2 to limit do
        if sieve[i] then
            for j in [ i * 2 .. i .. limit ] do
                sieve[j] <- false

    List.ofSeq (Array.indexed sieve |> Seq.filter (fun (_, isPrime) -> isPrime) |> Seq.map fst)
