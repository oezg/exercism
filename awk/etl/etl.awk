BEGIN {
    FPAT = "[[:digit:]]+|[[:alpha:]]"
    OFS = ","
}

{
    for (i = 2; i <= NF; i++) { array[tolower($i)] = $1 }
}

END {
    PROCINFO["sorted_in"] = "@ind_str_asc"

    for (key in array) print key, array[key]
}
