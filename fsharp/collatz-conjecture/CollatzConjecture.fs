module CollatzConjecture

let steps =
    Seq.unfold (function
        | outOfRange when outOfRange < 1 -> None
        | 1 -> Some(1, 0)
        | even when even % 2 = 0 -> Some(even, even / 2)
        | odd -> Some(odd, 3 * odd + 1))
    >> Seq.tryFindIndex ((=) 1)
