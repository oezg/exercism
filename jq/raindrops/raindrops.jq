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

def main:
    . + {array: [3, 5, 7], result: []}
    | tailcalloptimizable
    | (.result | add) // .number;

def glenn:
    .number as $n
    | {"Pling": 3, "Plang": 5, "Plong": 7}
    | to_entries
    | map(select($n % .value == 0))
    | map(.key)
    | add // $n;

glenn