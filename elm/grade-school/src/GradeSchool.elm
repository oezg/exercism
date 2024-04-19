module GradeSchool exposing (Grade, Result(..), School, Student, addStudent, allStudents, emptySchool, studentsInGrade)

import Dict exposing (..)


type alias Grade =
    Int


type alias Student =
    String


type alias School =
    Dict Int (List Student)


type Result
    = Added
    | Duplicate


emptySchool : School
emptySchool =
    Dict.empty


addStudent : Grade -> Student -> School -> ( Result, School )
addStudent grade student school =
    if List.member student (allStudents school) then
        ( Duplicate, school )

    else
        ( Added, Dict.insert grade (List.sort (student :: studentsInGrade grade school)) school )


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    Dict.get grade school
        |> Maybe.withDefault []


allStudents : School -> List Student
allStudents =
    Dict.values >> List.concat
