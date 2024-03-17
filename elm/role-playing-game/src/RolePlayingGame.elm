module RolePlayingGame exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    Maybe.withDefault "Mighty Magician" name


revive : Player -> Maybe Player
revive player =
    let
        alivePlayer =
            player.health > 0

        levelBelowTen =
            player.level < 10
    in
    if alivePlayer then
        Nothing

    else if levelBelowTen then
        Just { player | health = 100, mana = Nothing }

    else
        Just { player | health = 100, mana = Just 100 }


castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    case player.mana of
        Nothing ->
            ( { player | health = max 0 (player.health - manaCost) }, 0 )

        Just manaValue ->
            if manaValue < manaCost then
                ( player, 0 )

            else
                ( { player | mana = Just (manaValue - manaCost) }, manaCost * 2 )
