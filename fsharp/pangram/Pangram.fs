module Pangram

open System

let isPangram: string -> bool =
    Set.isSubset (set [ 'a' .. 'z' ]) <<  Set.map Char.ToLower << set
