.category as $cat
| .dice 
| def sum(die): (map(select(. == die)) | add // 0);
{
    ones: sum(1), twos: sum(2), threes: sum(3), fours: sum(4), fives: sum(5), sixes: sum(6),
    "full house": 
        (group_by(.) | map(select(length == (2, 3))) | if map(length) | add == 5 then add | add else 0 end),
    "four of a kind": (group_by(.) | map(select(length == (4, 5)) | first) | (first // 0) * 4),
    "little straight": (if sort == [1, 2, 3, 4, 5] then 30 else 0 end),
    "big straight": (if sort == [2, 3, 4, 5, 6] then 30 else 0 end),
    choice: add,
    yacht: (if unique | length == 1 then 50 else 0 end)
}[$cat]