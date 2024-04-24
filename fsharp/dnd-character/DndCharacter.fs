module DndCharacter

open System

[<Literal>]
let diceSides = 6

[<Literal>]
let diceCount = 4

[<Struct>]
type Character =
    { Strength: int
      Dexterity: int
      Constitution: int
      Intelligence: int
      Wisdom: int
      Charisma: int
      Hitpoints: int }

let private random = Random()

let modifier x = (x - 10.0) / 2.0 |> floor |> int

let ability () =
    Seq.init diceCount (fun _ -> random.Next diceSides + 1)
    |> Seq.sort
    |> Seq.tail
    |> Seq.sum

let createCharacter () =
    let constitution = ability ()

    { Strength = ability ()
      Dexterity = ability ()
      Constitution = constitution
      Intelligence = ability ()
      Wisdom = ability ()
      Charisma = ability ()
      Hitpoints = 10 + modifier constitution }
