module GuessingGame

let reply (guess: int): string = 
    match guess with
    | 42 -> "Correct"
    | 41 | 43 -> "So close"
    | guess when guess < 41 -> "Too low"
    | guess when guess > 43 -> "Too high"
    | _ -> "Invalid guess"