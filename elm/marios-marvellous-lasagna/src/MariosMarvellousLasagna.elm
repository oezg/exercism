module MariosMarvellousLasagna exposing (remainingTimeInMinutes)


remainingTimeInMinutes : Int -> Int -> Int
remainingTimeInMinutes layers minutes =
    let
        expectedMinutesInOven =
            40

        preparationTimeInMinutes numberOfLayers =
            2 * numberOfLayers
    in
    preparationTimeInMinutes layers + expectedMinutesInOven - minutes
