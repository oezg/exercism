BEGIN { FPAT = "[[:alpha:]]" }

{
    delete letters

    for (i = 1; i <= NF; i++) {
        canonical = tolower($i)

        if (canonical in letters) {
            print "false"
            next
        }

        letters[canonical] = 0
    }

    print "true"
}
