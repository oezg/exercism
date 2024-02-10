module TisburyTreasureHunt

let getCoordinate (_, coordinate) = coordinate

let convertCoordinate (coordinate: string): int * char = 
    int (coordinate.Substring(0, 1)), coordinate[1]

let compareRecords (azarasData: string * string) (ruisData: string * (int * char) * string) : bool = 
    let azarasCoordinate = azarasData |> getCoordinate |> convertCoordinate
    let (_, ruisCoordinate, _) = ruisData
    azarasCoordinate = ruisCoordinate

let createRecord (azarasData: string * string) (ruisData: string * (int * char) * string) : (string * string * string * string) =
    let (treasure, coordinate) = azarasData
    let (location, _, quadrant) = ruisData
    if compareRecords azarasData ruisData then 
        (coordinate, location, quadrant, treasure)
    else
        ("", "", "", "")
