def validate:
    if .number < 0 or .number > 32 then
        "Invalid number: \(.number)" | halt_error
    else
        .index = 0 | .actions = []
    end;

def action:
    ["wink", "double blink", "close your eyes", "jump"] as $actions
    | if .number % 2 == 1 then
        if .index < ($actions | length) then
            .actions += [$actions[.index]]
        else 
            .actions |= reverse
        end
    end;

def handshake:
    if .number > 0 then
        action
        | .number |= (. / 2 | floor)
        | .index += 1
        | handshake
    end;

validate | handshake | .actions
    