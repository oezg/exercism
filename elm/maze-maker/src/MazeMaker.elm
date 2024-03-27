module MazeMaker exposing (..)

import Random exposing (Generator, generate)


type Maze
    = DeadEnd
    | Room Treasure
    | Branch (List Maze)


type Treasure
    = Gold
    | Diamond
    | Friendship


deadend : Generator Maze
deadend =
    Random.lazy (\_ -> Random.constant DeadEnd)


treasure : Generator Treasure
treasure =
    Random.lazy (\_ -> Random.uniform Gold [ Diamond, Friendship ])


room : Generator Maze
room =
    Random.lazy (\_ -> Random.map (\t -> Room t) treasure)


branch : Generator Maze -> Generator Maze
branch mazeGenerator =
    Random.lazy (\_ -> mazeGenerator)


maze : Generator Maze
maze =
    Random.lazy (\_ -> Random.weighted ( 60, deadend ) [ ( 15, room ), ( 25, branch maze ) ])


mazeOfDepth : Int -> Generator Maze
mazeOfDepth depth =
    Random.lazy (\_ -> Debug.todo "Please implement mazeOfDepth")
