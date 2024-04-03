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
        Chest treas ->
            case treas of
                TreasureChest password _ ->
                    if String.length password < 8 then
                        Nothing

                    else
                        Just (Chest treas { conds | securePassword = () })


uniqueTreasures : List (Chest treasure conditions) -> List (Chest treasure { conditions | uniqueTreasure : () })
uniqueTreasures chests =
    Debug.todo "Please implement uniqueTreasures"


makeTreasureChest : Chest treasure { conditions | securePassword : (), uniqueTreasure : () } -> TreasureChest treasure
makeTreasureChest chest =
    Debug.todo "Please implement makeTreasureChest"
