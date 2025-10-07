BEGIN {
    FPAT = "[[:alnum:]]+"
    PROCINFO["sorted_in"] = "@ind_str_asc"
}

typeof($1) == "strnum" && NF > 1 {
    for (i = 2; i <= NF; i++) { array[tolower($i)] = $1 }
}

END {
    for (key in array) print key "," array[key]
}
