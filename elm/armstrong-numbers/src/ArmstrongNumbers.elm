module ArmstrongNumbers exposing (isArmstrongNumber)


isArmstrongNumber : Int -> Bool
isArmstrongNumber nb =
    let
        numberDigits number =
            if number == 0 then
                0

            else
                1 + numberDigits (number // 10)

        exponent =
            numberDigits nb

        elm state number =
            if number == 0 then
                state == 0

            else
                elm (state - modBy 10 number ^ exponent) (number // 10)
    in
    elm nb nb
