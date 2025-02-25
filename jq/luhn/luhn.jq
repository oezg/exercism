. / ""
| map(select(. != " "))
| reverse
| try (
    if length == 1 then error end
    | map(tonumber)
    | [(.[range(1; length; 2)] | . * 2 | if . > 9 then . - 9 end), .[range(0; length; 2)]]
    | add
    | . % 10 == 0
) catch false