module QueenAttack

let create (col: int, row: int) = 
    // A) 0 <= col && col < 8 && 0 <= row && row < 8
    // B) Seq.contains col [0..7] && Seq.contains row [0..7] 
    [col; row]
    |> Seq.forall (fun x -> Seq.contains x [0..7])

let canAttack (queen1: int * int) (queen2: int * int) = 
    
    if fst queen1 = fst queen2 then
        true
    elif snd queen1 = snd queen2 then
        true
    elif abs (fst queen1 - fst queen2) = abs (snd queen1 - snd queen2) then 
        true
    else
        false