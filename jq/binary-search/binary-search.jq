def search(left; right):
    if left < right then
        ((right + left) / 2 | floor) as $middle
        | if .array[$middle] == .value then 
            $middle
        elif .array[$middle] < .value then
            search($middle + 1; right)
        else
            search(left; $middle)
        end
    else
        "value not in array" | halt_error
    end;

search(0; .array | length)