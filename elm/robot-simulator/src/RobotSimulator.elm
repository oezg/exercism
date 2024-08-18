module RobotSimulator exposing
    ( Bearing(..)
    , Robot
    , advance
    , defaultRobot
    , simulate
    , turnLeft
    , turnRight
    )


type Bearing
    = North
    | East
    | South
    | West


rightOf : Bearing -> Bearing
rightOf bearing =
    case bearing of
        North ->
            East

        East ->
            South

        South ->
            West

        West ->
            North


leftOf : Bearing -> Bearing
leftOf bearing =
    case bearing of
        North ->
            West

        East ->
            North

        South ->
            East

        West ->
            South


type alias Robot =
    { bearing : Bearing
    , coordinates : { x : Int, y : Int }
    }


defaultRobot : Robot
defaultRobot =
    { bearing = North
    , coordinates = { x = 0, y = 0 }
    }


turnRight : Robot -> Robot
turnRight robot =
    { robot | bearing = rightOf robot.bearing }


turnLeft : Robot -> Robot
turnLeft robot =
    { robot | bearing = leftOf robot.bearing }


advance : Robot -> Robot
advance robot =
    case robot.bearing of
        North ->
            { robot | coordinates = { x = robot.coordinates.x, y = robot.coordinates.y + 1 } }

        East ->
            { robot | coordinates = { x = robot.coordinates.x + 1, y = robot.coordinates.y } }

        South ->
            { robot | coordinates = { x = robot.coordinates.x, y = robot.coordinates.y - 1 } }

        West ->
            { robot | coordinates = { x = robot.coordinates.x - 1, y = robot.coordinates.y } }


simulate : String -> Robot -> Robot
simulate directions robot =
    case String.uncons directions of
        Nothing ->
            robot

        Just ( direction, rest ) ->
            case direction of
                'A' ->
                    simulate rest (advance robot)

                'L' ->
                    simulate rest (turnLeft robot)

                'R' ->
                    simulate rest (turnRight robot)

                _ ->
                    defaultRobot
