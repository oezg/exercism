BEGIN { FPAT = "[[:alpha:]]" }

{
    points = 0

    $0 = toupper($0)

    for (i = 1; i <= NF; i++) points += score($i)

    print $0 "," points
}

function score(letter) {
    switch (letter) {
        case /[AEIOULNRST]/:
            return 1
        case /[DG]/:
            return 2
        case /[BCMP]/:
            return 3
        case /[FHVWY]/:
            return 4
        case /[K]/:
            return 5
        case /[JX]/:
            return 8
        case /[QZ]/:
            return 10
    }
}
