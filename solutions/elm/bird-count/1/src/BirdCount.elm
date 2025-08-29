module BirdCount exposing (busyDays, hasDayWithoutBirds, incrementDayCount, today, total)


today : List Int -> Maybe Int
today counts =
    case counts of
        [] ->
            Nothing

        count :: _ ->
            Just count


incrementDayCount : List Int -> List Int
incrementDayCount counts =
    case counts of
        [] ->
            [ 1 ]

        x :: xs ->
            x + 1 :: xs


hasDayWithoutBirds : List Int -> Bool
hasDayWithoutBirds counts =
    case counts of
        [] ->
            False

        0 :: _ ->
            True

        _ :: xs ->
            hasDayWithoutBirds xs


total : List Int -> Int
total counts =
    case counts of
        [] ->
            0

        x :: xs ->
            x + total xs


busyDays : List Int -> Int
busyDays counts =
    case counts of
        [] ->
            0

        x :: xs ->
            busyDays xs + min 1 (x // 5)
