def one: if length == 0 then "empty stack" | halt_error end;
def two: one | if length == 1 then "only one value on the stack" | halt_error end;
def zero: two | if .[0] == 0 then "divide by zero" | halt_error end;
def dup: one | .[:1] + .[:2];
def drop: one | .[1:2];
def swap: two | [.[1], .[0]];
def over: two | [.[1], .[0], .[1]];
def addition: two | [.[1] + .[0]];
def subtraction: two | [.[1] - .[0]];
def multiplication: two | [.[1] * .[0]];
def division: zero | [.[1] / .[0] | floor];

def table:
    {
        "dup": dup,
        "drop": drop,
        "over": over,
        "swap": swap,
        "+": addition,
        "-": subtraction,
        "*": multiplication,
        "/": division
    };

def x:
    reduce splits(" ") as $word ([];
    if $word | IN("+", "-", "*", "/", "dup", "drop", "swap", "over", "dup-twice", "countup") then
        if $word == "dup" then
            dup
        elif $word == "dup-twice" then
            dup | dup
        elif $word == "drop" then
            drop
        elif $word == "swap" then
            swap
        elif $word == "over" then
            over
        elif $word == "+" then
            addition
        elif $word == "-" then
            subtraction
        elif $word == "*" then
            multiplication
        elif $word == "/" then
            division
        elif $word == "countup" then
            [3,2,1] + .[:2]
        end
    else
        [$word | tonumber] + .[:2]
    end + .[2:]);


# .instructions[-1]
# | x
# | reverse

reduce .instructions[] as $instruction (table;
    ($instruction | split(" ")) as $words
    | if $instruction | startswith(":") then
        . + {($words[1]): $words[2:-1]}
    else
        . as $table
        | reduce ($instruction | splits(" ")) as $word ([];
                debug |
            if $word | in($table) then
                $table[$word]
            else
                [$word | tonumber] + .[:2]
            end + .[2:]
        )
    end
)