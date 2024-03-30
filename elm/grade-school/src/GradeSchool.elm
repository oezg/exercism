module GradeSchool exposing (Grade, Result(..), School, Student, addStudent, allStudents, emptySchool, studentsInGrade)

import Dict exposing (..)
import Set


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
    let
        result =
            if List.member student <| allStudents school then
                Duplicate

            else
                Added

        update maybeListStudents =
            case maybeListStudents of
                Nothing ->
                    List.singleton student
                        |> Just

                Just list ->
                    list
                        |> Set.fromList
                        |> Set.insert student
                        |> Set.toList
                        |> Just

        newSchool =
            case result of
                Duplicate ->
                    school

                Added ->
                    Dict.update grade update school
    in
    ( result, newSchool )


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    Dict.get grade school
        |> Maybe.withDefault []


allStudents : School -> List Student
allStudents =
    Dict.values >> List.concat
