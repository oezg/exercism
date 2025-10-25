BEGIN {
    FPAT = "[[:alpha:]]"
    elif["AEIOULNRST"] = 1
    elif["DG"] = 2
    elif["BCMP"] = 3
    elif["FHVWY"] = 4
    elif["K"] = 5
    elif["JX"] = 8
    elif["QZ"] = 10
}

{
    $0 = toupper($0)

    for (i = 1; i <= NF; i++)
    for (letters in elif)
    if (letters ~ $i) points += elif[letters]

    print $0 "," 0 + points
}
