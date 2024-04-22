module ErrorHandling

open System

let handleErrorByThrowingException () = failwith "I am learning how to fail"

let handleErrorByReturningOption (input: string) : int option =
    match Int32.TryParse(input) with
    | true, value -> Some value
    | false, _ -> None

let handleErrorByReturningResult (input: string) : Result<int, string> =
    match handleErrorByReturningOption input with
    | Some value -> Ok value
    | None -> Error "Could not convert input to integer"

let bind switchFunction twoTrackInput =
    match twoTrackInput with
    | Ok value -> switchFunction value
    | Error message -> Error message

let cleanupDisposablesWhenThrowingException (resource: IDisposable) =
    try
        failwith "I got better at failing"
    finally
        resource.Dispose()
