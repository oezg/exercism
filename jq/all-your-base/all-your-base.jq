def fail_when(cond; msg): if cond then msg | halt_error end;
def validate:
    .inputBase as $ib
    | fail_when(.inputBase < 2; "input base must be >= 2")
    | fail_when((.digits | any(. < 0 and $ib <= .)); "all digits must satisfy 0 <= d < input base");

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