def validate:
    reduce 
    (
        {message: "input base must be >= 2", condition: (.inputBase < 2)},
        {message: "all digits must satisfy 0 <= d < input base", 
        condition: (.inputBase as $inputBase | .digits | any(. < 0 or $inputBase <= .))},
        {message: "output base must be >= 2", condition: (.outputBase < 2)}
    ) as $error (.; if $error.condition then $error.message | halt_error end);

def undigits:
    .inputBase as $base
    | .total
    = (.digits
    | reverse
    | to_entries
    | map(until(.key == 0; .value *= $base | .key -= 1) | .value)
    | add // 0);

def digits:
    [
        (while(.total > 0; .total = (.total / .outputBase | floor)) // .)
        | .total % .outputBase
    ]
    | reverse;

validate | undigits | digits