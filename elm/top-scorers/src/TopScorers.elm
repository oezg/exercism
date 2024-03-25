module TopScorers exposing (..)

import Dict exposing (Dict)
import TopScorersSupport exposing (PlayerName)


updateGoalCountForPlayer : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
updateGoalCountForPlayer playerName =
    Dict.update playerName (\maybeCount -> Just (Maybe.withDefault 0 maybeCount + 1))


aggregateScorers : List PlayerName -> Dict PlayerName Int
aggregateScorers =
    List.foldl updateGoalCountForPlayer Dict.empty


removeInsignificantPlayers : Int -> Dict PlayerName Int -> Dict PlayerName Int
removeInsignificantPlayers goalThreshold =
    Dict.filter (\_ v -> v >= goalThreshold)


resetPlayerGoalCount : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
resetPlayerGoalCount playerName =
    Dict.insert playerName 0


formatPlayer : PlayerName -> Dict PlayerName Int -> String
formatPlayer playerName playerGoalCounts =
    playerName ++ ": " ++ (Maybe.withDefault 0 (Dict.get playerName playerGoalCounts) |> String.fromInt)


formatPlayers : Dict PlayerName Int -> String
formatPlayers players =
    players
        |> Dict.keys
        |> List.map (\player -> formatPlayer player players)
        |> String.join ", "


combineGames : Dict PlayerName Int -> Dict PlayerName Int -> Dict PlayerName Int
combineGames game1 game2 =
    Dict.merge Dict.insert (\k v1 v2 -> Dict.insert k (v1 + v2)) Dict.insert game1 game2 Dict.empty
