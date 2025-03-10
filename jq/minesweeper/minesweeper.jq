def indices: [., first | length | [range(.)]]
    | combinations
    | {row: first, col: last};

(split("\n")[:-1] | map(split(""))) as $matrix
| $matrix
| reduce indices as $index (.; (
    [-1,0,1]
    | [combinations(2)
        | [first + $index.row, last + $index.col]
        | select(first >= 0 and last >= 0 and $matrix[first][last] == "*")]
    | length) as $count_adjacent_mines
    | .[$index.row][$index.col] |= if . != "*" and $count_adjacent_mines > 0 then
        $count_adjacent_mines
    end)
| map(join(""))