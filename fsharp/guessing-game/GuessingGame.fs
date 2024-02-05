module GuessingGame

let reply = function
    | 42 -> "Correct"
    | 41 | 43 -> "So close"
    | guess when guess < 41 -> "Too low"
    | _ -> "Too high"