.category as $cat
| .dice
| def sum(die): map(select(. == die)) | add // 0;
def groups_of(sizes): group_by(.) | map(select(length == sizes));
def when(cond; value): if cond then value else 0 end;
{
    "full house": groups_of(2, 3) | add | when(length == 5; add),
    "four of a kind": groups_of(4, 5) | when(length > 0; first | first * 4),
    "little straight": when(sort == [1, 2, 3, 4, 5]; 30),
    "big straight": when(sort == [2, 3, 4, 5, 6]; 30),
    choice: add,
    yacht: when(unique | length == 1; 50),
    ones: sum(1), twos: sum(2), threes: sum(3), fours: sum(4), fives: sum(5), sixes: sum(6)
}[$cat]