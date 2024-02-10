module BirdWatcher

let lastWeek: int[] = [|0; 2; 5; 3; 7; 8; 4|]

let yesterday: int[] -> int =
  Seq.rev
  >> Seq.skip 1
  >> Seq.head

let total: int[] -> int = Array.sum

let dayWithoutBirds: int[] -> bool = Array.contains 0

let incrementTodaysCount (counts: int array) : int array =
  [| for i in 1 .. counts.Length -> counts[i-1] + if i = counts.Length then 1 else 0 |]
  
  // counts
  // |> Array.mapi (fun index count -> 
  //   count + if index = counts.Length - 1 then 1 else 0)
  
  
let unusualWeek(counts: int[]): bool =
  match counts with
  | [|5; _; 5; _; 5; _; 5|]
  | [|_; 0; _; 0; _; 0; _|]
  | [|_; 10; _; 10; _; 10; _|] -> true
  | _ -> false
