module TwoFer

let twoFer = 
    Option.defaultValue "you"  >> sprintf "One for %s, one for me."
