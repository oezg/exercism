def pling:
    {"3": "i", "5": "a", "7": "o"}[tostring] | "Pl\(.)ng";

def tailcalloptimizable:
    if .array != [] then
        (.array | first) as $head
        | .array |= .[1:]
        | if .number % $head == 0 then
            .result += [$head | pling]
        end
        | tailcalloptimizable
    end;

. + {array: [3, 5, 7], result: []}
| tailcalloptimizable
| (.result | add) // .number
