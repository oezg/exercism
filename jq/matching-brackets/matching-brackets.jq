def brackets: {")": "(", "]": "[", "}": "{"};

def brack:
    .value[:1] as $head 
    | .value |= .[1:]
    | if $head == "" then
        .stack == []
    elif $head | IN(brackets[]) then 
        .stack += [$head] | brack
    elif $head | in(brackets) then
        brackets[$head] == (.stack | last) and (.stack |= .[:-1] | brack)
    else
        brack
    end;

.stack = [] | brack