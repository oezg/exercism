/[[:digit:]]+/ { scores[++counter] = $1 }

/list/ {
    for (idx in scores) print scores[idx]
}

/latest/ { print scores[counter] }

/personalBest/ { top(1) }

/personalTopThree/ { top(3) }

function top(x) {
    asort(scores, temp, "@val_num_desc")

    while (idx < x) print temp[++idx]
}
