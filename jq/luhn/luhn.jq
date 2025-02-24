. / ""
| map(select(. != " "))
| reverse
| to_entries
| try (
    if length == 1 then error end
    | map(.value |= tonumber)
    | reduce .[] as $i (0;
        . + if $i.key % 2 == 0 then
            $i.value
        else
            $i.value * 2 - (if $i.value < 5 then 0 else 9 end)
        end)
    | . % 10 == 0
) catch false
