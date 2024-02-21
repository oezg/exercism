module RobotSimulator

type Direction = North | East | South | West
type Position = int * int
type Robot = Robot of direction: Position * position: Position

let toPosition =
    function
    | North -> (0, 1)
    | East -> (1, 0)
    | South -> (0, -1)
    | West -> (-1, 0)

let turnLeft (Robot((x, y), pos)) =
    Robot((-y, x), pos)

let turnRight (Robot((x, y), pos)) =
    Robot((y, -x), pos)

let advance (Robot(dirX, dirY as dir, (posX, posY))) =
    Robot(dir, (dirX + posX, dirY + posY))

let create direction position =
    Robot(toPosition direction, position)

let move (instructions: string) (robot: Robot): Robot =
    let instruct robot =
        function
        | 'A' -> advance robot
        | 'L' -> turnLeft robot
        | 'R' -> turnRight robot
        | _   -> failwith "Invalid instruction"

    Seq.fold instruct robot instructions