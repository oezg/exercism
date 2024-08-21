module CollatzConjecture exposing (collatz)


collatz : Int -> Result String Int
collatz start =
    if start < 1 then
        Err "Only positive integers are allowed"

    else if start == 1 then
        Ok 0

    else
        collatz
            (if modBy 2 start == 0 then
                start // 2

             else
                3 * start + 1
            )
            |> Result.map ((+) 1)
