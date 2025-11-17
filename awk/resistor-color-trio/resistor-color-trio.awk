BEGIN {
    while ((getline line < "bands.txt") > 0) {
        split(line, row)
        bands[row[1]] = row[2]
    }

    prefix[9] = "giga"
    prefix[6] = "mega"
    prefix[3] = "kilo"
}

{
    for (i = 1; i <= NF; i++) {
        if ($i in bands) continue

        print "invalid color" > "/dev/stderr"
        exit 1
    }
}

{
    zeros = bands[$3]
    value = 10 * bands[$1] + bands[$2]

    if (value % 10 == 0) {
        zeros++
        value = int(value / 10)
    }

    factor = find_factor()

    print value * 10 ^ (zeros - factor) " " prefix[factor] "ohms"
}

function find_factor() {
    PROCINFO["sorted_in"] = "@ind_num_desc"

    for (factor in prefix)
    if (zeros >= factor) return factor
}
