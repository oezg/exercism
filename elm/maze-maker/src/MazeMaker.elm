module MazeMaker exposing (..)

import Random exposing (Generator)


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
    Random.constant DeadEnd


treasure : Generator Treasure
treasure =
    Random.uniform Gold [ Diamond, Friendship ]


room : Generator Maze
room =
    Random.map (\t -> Room t) treasure


branch : Generator Maze -> Generator Maze
branch mazeGenerator =
    Random.int 2 4
        |> Random.andThen (\n -> Random.list n mazeGenerator |> Random.map Branch)


maze : Generator Maze
maze =
    Random.weighted
        ( 12, deadend )
        [ ( 3, room )
        , ( 5, (\_ -> maze) |> Random.lazy |> branch )
        ]
        |> Random.andThen identity


mazeOfDepth : Int -> Generator Maze
mazeOfDepth depth =
    if depth == 0 then
        Random.uniform deadend [ room ] |> Random.andThen identity

    else
        mazeOfDepth (depth - 1)
            |> branch
