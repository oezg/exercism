module ValentinesDay exposing (..)


type Approval
    = Yes
    | No
    | Maybe


type Cuisine
    = Korean
    | Turkish


type Genre
    = Crime
    | Horror
    | Romance
    | Thriller


type Activity
    = BoardGame
    | Chill
    | Movie Genre
    | Restaurant Cuisine


rateActivity : Activity -> Approval
rateActivity activity =
    case activity of
        Movie Romance ->
            Yes

        Restaurant Korean ->
            Yes

        Restaurant Turkish ->
            Maybe

        _ ->
            No
