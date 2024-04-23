module DndCharacter

open System

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
    seq {
        for _ = 1 to 4 do
            random.Next(1, 7)
    }
    |> Seq.sort
    |> Seq.skip 1
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
