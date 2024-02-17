module GradeSchool

type Student = string 
type Roster = Student list
type Grade = int
type School = Map<Grade, Roster>

let empty: School = School([])

let grade (number: Grade): School -> Roster = 
    Map.tryFind number  >> Option.defaultValue [] >> List.sort

let roster: School -> Roster = 
    Map.values >> Seq.collect Seq.sort >> List.ofSeq

let private changer (student: Student): Roster option -> Roster option =
    Option.defaultValue [] >> (fun roster -> student :: roster) >> Some
    
let add (student: Student) (gradeNumber: Grade): School -> School = 
    function
    | school when school |> (Map.values >> Seq.concat >> Seq.contains student) -> school
    | school -> school |> Map.change gradeNumber (changer student)
