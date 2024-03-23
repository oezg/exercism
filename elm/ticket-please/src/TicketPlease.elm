module TicketPlease exposing (..)

import List exposing (member)
import TicketPleaseSupport exposing (Status(..), Ticket(..), User(..))


devteam : List String
devteam =
    [ "Alice", "Bob", "Charlie" ]


emptyComment : ( User, String ) -> Bool
emptyComment ( _, comment ) =
    String.isEmpty comment


numberOfCreatorComments : Ticket -> Int
numberOfCreatorComments (Ticket { createdBy, comments }) =
    let
        ( creator, _ ) =
            createdBy
    in
    List.length <|
        List.filter (\( user, _ ) -> user == creator) comments


assignedToDevTeam : Ticket -> Bool
assignedToDevTeam (Ticket { assignedTo }) =
    case assignedTo of
        Just user ->
            case user of
                User x ->
                    member x devteam

        _ ->
            False


assignTicketTo : User -> Ticket -> Ticket
assignTicketTo user (Ticket ({ status } as original)) =
    case status of
        Archived ->
            Ticket original

        New ->
            Ticket { original | status = InProgress, assignedTo = Just user }

        _ ->
            Ticket { original | assignedTo = Just user }
