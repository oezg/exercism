BEGIN {
    FS = ","
    PROCINFO["sorted_in"] = "@val_num_asc"
}

{
    if (!($1 in roster)) roster[$1] = $2
}

END {
    for (student in roster)
    if (!grade || roster[student] == grade) out = out "," student

    print substr(out, 2)
}
