module BlorkemonCards exposing
    ( Card
    , compareShinyPower
    , expectedWinner
    , isMorePowerful
    , maxPower
    , sortByCoolness
    , sortByMonsterName
    )


type alias Card =
    { monster : String, power : Int, shiny : Bool }


isMorePowerful : Card -> Card -> Bool
isMorePowerful card1 card2 =
    card1.power > card2.power


maxPower : Card -> Card -> Int
maxPower card1 card2 =
    max card1.power card2.power


sortByMonsterName : List Card -> List Card
sortByMonsterName =
    List.sortBy .monster


boolToInt : Bool -> number
boolToInt b =
    if b then
        1

    else
        0


compareBooleans : Bool -> Bool -> Order
compareBooleans a b =
    compare (boolToInt a) (boolToInt b)


orderByShininessAscending : Card -> Card -> Order
orderByShininessAscending a b =
    compareBooleans a.shiny b.shiny


orderByCoolnessAscending : Card -> Card -> Order
orderByCoolnessAscending a b =
    case orderByShininessAscending a b of
        EQ ->
            compare a.power b.power

        shinyOrder ->
            shinyOrder


sortByCoolness : List Card -> List Card
sortByCoolness =
    List.sortWith
        orderByCoolnessAscending
        >> List.reverse


compareShinyPower : Card -> Card -> Order
compareShinyPower card1 card2 =
    if card1.power == card2.power then
        orderByShininessAscending card1 card2

    else
        compare card1.power card2.power


expectedWinner : Card -> Card -> String
expectedWinner card1 card2 =
    case compareShinyPower card1 card2 of
        LT ->
            card2.monster

        EQ ->
            "too close to call"

        _ ->
            card1.monster
