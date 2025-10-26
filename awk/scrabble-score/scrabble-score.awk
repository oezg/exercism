BEGIN {
    FPAT = "[[:alpha:]]"
    OFS = ","
    IGNORECASE = 1
}

{
    for (i = 1; i <= NF; i++) {
        switch ($i) {
            case /[AEIOULNRST]/ : points += 1; break
            case /[DG]/         : points += 2; break
            case /[BCMP]/       : points += 3; break
            case /[FHVWY]/      : points += 4; break
            case /[K]/          : points += 5; break
            case /[JX]/         : points += 8; break
            case /[QZ]/         : points += 10; break
        }
    }

    print toupper($0), +points
}
