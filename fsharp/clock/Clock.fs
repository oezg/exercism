module Clock

type Clock = {
    Hour: int
    Minute: int
}

let rec newClock minutes = 
    let clean = minutes % (60*24)
    if clean >= 0 then
        {
            Hour = clean / 60
            Minute = clean % 60
        }
    else 
        newClock (clean + (60*24) )

let minutesOf clock =
    clock.Hour * 60 + clock.Minute

let create hours minutes: Clock = newClock (minutes + 60 * hours)

let add (minutes: int) (clock: Clock): Clock = newClock (minutesOf clock + minutes)

let subtract minutes clock = add -minutes clock

let rec display clock = sprintf "%02d:%02d" clock.Hour clock.Minute
