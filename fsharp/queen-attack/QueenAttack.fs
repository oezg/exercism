module QueenAttack

let create (queen: int * int) = 
    let row, col = queen
    0 <= row && 0 <= col && row < 8 && col < 8

let canAttack (queen1: int * int) (queen2: int * int) = 
    let row1, col1 = queen1
    let row2, col2 = queen2
    row1 = row2
    || col1 = col2
    || abs (row1 - row2) = abs (col1 - col2)