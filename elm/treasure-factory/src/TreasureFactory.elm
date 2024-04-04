module TreasureFactory exposing (TreasureChest, getTreasure, makeChest, makeTreasureChest, secureChest, uniqueTreasures)


type TreasureChest treasure
    = TreasureChest String treasure


getTreasure : String -> TreasureChest a -> Maybe a
getTreasure passwordAttempt (TreasureChest password treasure) =
    if passwordAttempt == password then
        Just treasure

    else
        Nothing


type Chest treasure conditions
    = Chest (TreasureChest treasure)


makeChest : String -> treasure -> Chest treasure {}
makeChest password treasure =
    Chest (TreasureChest password treasure)


secureChest : Chest treasure conditions -> Maybe (Chest treasure { conditions | securePassword : () })
secureChest chest =
    case chest of
        Chest treasureChest ->
            case treasureChest of
                TreasureChest password treasure ->
                    if String.length password < 8 then
                        Nothing

                    else
                        Just (Chest (TreasureChest password treasure))


uniqueTreasures : List (Chest treasure conditions) -> List (Chest treasure { conditions | uniqueTreasure : () })
uniqueTreasures chests =
    let
        toTreasure : Chest treasure conditions -> treasure
        toTreasure chest =
            case chest of
                Chest treasureChest ->
                    case treasureChest of
                        TreasureChest _ treasure ->
                            treasure

        treasures : List treasure
        treasures =
            List.map (\c -> toTreasure c) chests

        counter chest =
            let
                mytreasure =
                    toTreasure chest
            in
            List.length (List.filter (\t -> mytreasure == t) treasures)

        uniqer : Chest treasure conditions -> Chest treasure { conditions | uniqueTreasure : () }
        uniqer c =
            case c of
                Chest treasureChest ->
                    Chest treasureChest
    in
    List.filter (\c -> 1 == counter c) chests
        |> List.map uniqer


makeTreasureChest : Chest treasure { conditions | securePassword : (), uniqueTreasure : () } -> TreasureChest treasure
makeTreasureChest chest =
    case chest of
        Chest treasureChest ->
            treasureChest
