module RobotSimulator

type Direction = North | East | South | West
type Position = int * int

type Robot = {
    Direction: Direction
    Position: Position
}

type Side = 
    | Left
    | Right

let private turn (side: Side) (robot: Robot) =
    match robot.Direction with
    | North -> if side = Left then {robot with Direction = West} else {robot with Direction = East}
    | East  -> if side = Left then {robot with Direction = North} else {robot with Direction = South}
    | South -> if side = Left then {robot with Direction = East} else {robot with Direction = West}
    | West  -> if side = Left then {robot with Direction = South} else {robot with Direction = North}

let private advance (robot: Robot) =
    match robot.Direction with
    | North -> {robot with Position = (fst robot.Position, snd robot.Position + 1)}
    | East  -> {robot with Position = (fst robot.Position + 1, snd robot.Position)}
    | South -> {robot with Position = (fst robot.Position, snd robot.Position - 1)}
    | West  -> {robot with Position = (fst robot.Position - 1, snd robot.Position)}

let private movement (chr: char) =
    match chr with
    | 'A' -> advance
    | 'R' -> turn Right
    | 'L' -> turn Left
    | _ -> id  // I don't know what to do here, I can't throw an Exception

let create direction position = 
    {
        Direction = direction
        Position = position
    }

let move (instructions: string) (robot: Robot) = 
    instructions 
    |> Seq.map movement 
    |> Seq.fold (fun rbt mvmt -> mvmt rbt) robot