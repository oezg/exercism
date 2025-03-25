def dup:
    if length == 0 then
        "empty stack" | halt_error
    else
        .[:1] + .[:2]
    end;

def drop: .[1:2];
def swap: [.[1], .[0]];
def over: [.[1], .[0], .[1]];
def addition: [.[1] + .[0]];
def subtraction: [.[1] - .[0]];
def multiplication: [.[1] * .[0]];
def division: if .[0] == 0 then "divide by zero" | halt_error else [.[1] / .[0] | floor] end;


def table:
    {
        dup: dup,
        drop: drop,
        over: over,
        swap: swap,
        "+": addition,
        "-": subtraction,
        "*": multiplication,
        "/": division
    };

def x:
    reduce splits(" ") as $instruction ([];
    if $instruction | IN("+", "-", "*", "/", "dup", "drop", "swap", "over") then
        if length == 0 then
            "empty stack" | halt_error
        elif $instruction == "dup" then
            dup
        elif $instruction == "drop" then
            drop
        elif length == 1 then
            "only one value on the stack" | halt_error
        elif $instruction == "swap" then
            swap
        elif $instruction == "over" then
            over
        elif $instruction == "+" then
            addition
        elif $instruction == "-" then
            subtraction
        elif $instruction == "*" then
            multiplication
        else
            division
        end
    else
        [$instruction | tonumber] + .[:2]
    end + .[2:])
    | reverse;

.instructions[0]
| x