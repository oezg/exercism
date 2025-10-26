{
    var = $1

    isnumber() ? scores[++counter] = var : @var()
}

function isnumber() { return /^[+-]?[[:digit:]]+$/ }

function list() {
    PROCINFO["sorted_in"] = "@ind_num_asc"

    for (idx in scores) print scores[idx]
}

function latest() { print scores[length(scores)] }

function personalBest() {
    n = asort(scores, temp, "@val_num_desc")

    for (idx in temp) {
        print temp[idx]
        break
    }
}

function personalTopThree() {
    n = asort(scores, temp, "@val_num_desc")

    for (idx = 1; idx <= 3 && idx <= n; idx++) print temp[idx]
}
