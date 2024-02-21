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

let (^^) (x, y) (left: bool) =
    if left then (-y, x) else (y, -x)

let turnLeft (left: bool) (Robot(dir, pos)) =
    Robot(dir ^^ left, pos)

let (+) (x1, y1) (x2, y2) =
    (x1 + x2, y1 + y2)

let advance (Robot(dir, pos)) =
    Robot(dir, dir + pos)

let create direction position =
    Robot(toPosition direction, position)

let (|Advance|_|) chr = if chr = 'A' then Some(advance) else None
let (|Right|_|) chr = if chr = 'R' then Some(turnLeft false) else None
let (|Left|_|) chr = if chr = 'L' then Some(turnLeft true) else None

let move (instructions: string) (robot: Robot): Robot =
    let instruct robot =
        function
        | Advance advance -> advance robot
        | Left turn -> turn robot
        | Right turn -> turn robot
        | _ -> failwith "Invalid instruction"

    Seq.fold instruct robot instructions