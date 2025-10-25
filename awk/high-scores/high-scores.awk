/[[:digit:]]+/ { scores[++counter] = $1 }

/list/ {
    PROCINFO["sorted_in"] = "@ind_num_asc"

    for (idx in scores) print scores[idx]
}

/latest/ { print scores[length(scores)] }

/personalBest/ {
    n = asort(scores, temp, "@val_num_desc")

    for (idx in temp) {
        print temp[idx]
        break
    }
}

/personalTopThree/ {
    n = asort(scores, temp, "@val_num_desc")

    for (idx = 1; idx <= 3 && idx <= n; idx++) print temp[idx]
}
