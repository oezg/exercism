module BirdWatcher

let lastWeek: int[] =
  [|0; 2; 5; 3; 7; 8; 4|]

let yesterday(counts: int[]): int =
  counts[Array.length counts - 2]

let total(counts: int[]): int =
  Array.sum counts

let dayWithoutBirds(counts: int[]): bool =
  Array.exists (fun x -> x = 0) counts

let incrementTodaysCount(counts: int[]): int[] =
  counts[Array.length counts - 1] <- counts[Array.length counts - 1] + 1
  counts

let unusualWeek(counts: int[]): bool =
  match counts with
  | [|5; _; 5; _; 5; _; 5|]
  | [|_; 0; _; 0; _; 0; _|]
  | [|_; 10; _; 10; _; 10; _|] -> true
  | _ -> false
