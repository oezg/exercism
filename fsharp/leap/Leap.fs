module Leap

let leapYear year =
    year % 400 = 0 || (year % 4 = 0 && year % 100 <> 0)
    // function
    // | year when year % 400 = 0 -> true
    // | year when year % 100 = 0 -> false
    // | year when year % 4 = 0 -> true
    // | _ -> false