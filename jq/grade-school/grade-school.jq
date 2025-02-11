.input.desiredGrade as $grade
| .input.students
| unique_by(first)
| sort_by(last, first)
| if $grade then map(select(last == $grade)) end
| map(first)