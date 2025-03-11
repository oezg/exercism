def subsets:
    if length > 0 then
        (.[1:] | subsets) as $s
        | $s + [first], $s
    end;

.maximumWeight as $max_weight
| .items
| [
    subsets
    | select(map(.weight) | add <= $max_weight)
    | map(.value) | add
]
| max // 0