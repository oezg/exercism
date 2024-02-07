module TracksOnTracksOnTracks

let newList: string list = []

let existingList: string list = ["F#"; "Clojure"; "Haskell"]

let addLanguage (language: string) (languages: string list): string list =
    language::languages

let countLanguages = List.length

let reverseList = List.rev

let excitingList = 
    function
    | "F#" :: _
    | _ :: "F#" :: ([] | [ _ ]) -> true
    | _ -> false
