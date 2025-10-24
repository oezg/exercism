BEGIN {
    FS = ","
    PROCINFO["sorted_in"] = "@val_num_asc"
}

{
    if (!($1 in roster)) roster[$1] = $2
}

END {
    if (action == "grade")

        for (student in roster)
        if (roster[student] != grade) delete roster[student]

    for (student in roster) out = out "," student

    print substr(out, 2)
}
