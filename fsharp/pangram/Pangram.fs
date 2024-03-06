module Pangram

open System

let isPangram: string -> bool =
    set >> Set.map Char.ToLower >> Set.isSubset (set [ 'a' .. 'z' ])
