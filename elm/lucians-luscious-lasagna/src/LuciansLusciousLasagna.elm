module LuciansLusciousLasagna exposing (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes)


expectedMinutesInOven : number
expectedMinutesInOven =
    40


preparationTimeInMinutes : number -> number
preparationTimeInMinutes layers =
    2 * layers


elapsedTimeInMinutes : number -> number -> number
elapsedTimeInMinutes layers minutes =
    minutes + preparationTimeInMinutes layers
