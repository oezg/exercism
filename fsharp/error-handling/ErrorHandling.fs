module ErrorHandling
(*
    open ErrorHandlingTest
    why is this not allowed? I want to refer to the Reource type.
    Is it to prevent circular reference?
*)

exception MyError of string

let handleErrorByThrowingException () =
    (*
        Why are these exceptions not passing the test?
        raise (MyError ("I am learning how to fail"))
        invalidArg "123" "I am learning how to fail"
        invalidOp "I am learning how to fail"
        nullArg "123"
    *)
    failwith "I am learning how to fail"

let handleErrorByReturningOption (input: string) : int option =
    try
        Some(int input)
    with :? System.FormatException as ex ->
        None

let handleErrorByReturningResult (input: string) : Result<int, string> =
    (*
        I shhould use this code but I want to play with try-with
        match handleErrorByReturningOption input with
        | Some value -> Ok value
        | None -> Error "Could not convert input to integer"
    *)
    try
        Ok(int input)
    with :? System.FormatException as ex ->
        Error "Could not convert input to integer"

let bind switchFunction twoTrackInput =
    match twoTrackInput with
    | Ok value -> switchFunction value
    | Error message -> Error message

let cleanupDisposablesWhenThrowingException resource =
    (*
        Why is this exception not passing the test?
        using resource (fun x -> raise (MyError("I am learning how to fail")))
        Why do I need the empty pair of parenthesis in the soluion?
    *)
    using resource (fun _ -> handleErrorByThrowingException ())
