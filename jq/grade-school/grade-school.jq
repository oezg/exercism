def roster:
    .input.students | unique_by(first) | sort_by(last, first);

def grade(n):
    roster | map(select(last == n)) | map(first);

def all_grades:
    roster | map(first);

if .property == "roster" then
    all_grades
else
    .input.desiredGrade as $n
    | grade($n)
end