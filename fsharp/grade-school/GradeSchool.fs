module GradeSchool

type Student = string 
type Roster = Student list
type Grade = int
type School = Map<Grade, Roster>

let empty: School = School([])

let grade (number: Grade): School -> Roster = 
    Map.tryFind number  >> Option.defaultValue []

let roster: School -> Roster = 
    Map.values >> Seq.collect Seq.sort >> List.ofSeq

let private addToRoster (student: Student) (roster: Roster) : Roster =
    List.sort (student :: roster)

let private changer (student: Student): option<Roster> -> option<Roster> =
    // (Option.defaultValue [] >> (fun xs -> student :: xs) >> Some)
    function
    | Some roster -> Some (addToRoster student roster)
    | None -> Some (addToRoster student [])
    
let add (student: Student) (gradeNumber: Grade): School -> School = 
    function
    | school when school |> (Map.values >> Seq.concat >> Seq.contains student) -> school
    | school -> school |> Map.change gradeNumber (changer student)
