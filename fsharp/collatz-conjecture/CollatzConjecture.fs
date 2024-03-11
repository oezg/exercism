module CollatzConjecture

let (|Even|Odd|) number = if number % 2 = 0 then Even else Odd

let (|InRange|_|) n = if n > 0 then Some() else None 

let steps (number: int): int option = 
    
    let rec collatz acc num = 
        match num with
        | 1 -> acc
        | Even -> collatz (acc + 1) (num / 2)
        | Odd -> collatz (acc + 1) (3 * num + 1)
    
    match number with
    | InRange -> collatz 0 number |> Some
    | _ -> None