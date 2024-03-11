module ArmstrongNumbers

let isArmstrongNumber (number: int) : bool =

    let summer xs =
        Seq.sumBy (fun x -> pown x (Seq.length xs)) xs

    let rec convertNum2DigitsArray acc n =
        if n = 0 then
            acc
        else
            convertNum2DigitsArray ((n % 10) :: acc) (n / 10)

    number = (summer <| convertNum2DigitsArray [] number)
