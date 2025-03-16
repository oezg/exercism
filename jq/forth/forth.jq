.instructions[0]
| reduce splits(" ") as $instruction ([];
if $instruction | IN("+", "-", "*", "/") then
    if length == 0 then
        "empty stack" | halt_error
    elif length == 1 then
        "only one value on the stack" | halt_error
    elif $instruction == "+" then
        [.[1] + .[0]]
    elif $instruction == "-" then
        [.[1] - .[0]]
    elif $instruction == "*" then
        [.[1] * .[0]]
    elif .[0] == 0 then
        "divide by zero" | halt_error
    else
        [.[1] / .[0] | floor]
    end
else
    [$instruction | tonumber] + .[:2]
end + .[2:])
| reverse