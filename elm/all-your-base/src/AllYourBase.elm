module AllYourBase exposing (rebase)


rebase : Int -> List Int -> Int -> Maybe (List Int)
rebase inBase digits outBase =
    let
        invalid =
            List.isEmpty digits || List.any (\d -> d < 0 || d >= inBase) digits || List.all ((==) 0) digits
    in
    if inBase < 2 || outBase < 2 || invalid then
        Nothing

    else
        let
            summing d s =
                inBase * s + d

            convertToOutBase n =
                if n == 0 then
                    []

                else
                    convertToOutBase (n // outBase) ++ [ modBy outBase n ]
        in
        convertToOutBase (List.foldl summing 0 digits) |> Just
