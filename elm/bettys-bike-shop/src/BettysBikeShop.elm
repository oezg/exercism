module BettysBikeShop exposing (penceToPounds, poundsToString)

import String


penceToPounds : Int -> Float
penceToPounds pence =
    Basics.toFloat pence / 100


poundsToString : Float -> String
poundsToString pounds =
    "£" ++ String.fromFloat pounds
