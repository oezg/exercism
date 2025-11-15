BEGIN {
    while (getline line < "codons.txt") {
        split(line, row, ": ")
        codons[row[1]] = row[2]
    }

    FPAT = ".{1,3}"
}

{
    for (i = 1; i <= NF; i++) 
    switch($i = codons[$i]) {
        case "":
            print "Invalid codon" > "/dev/stderr"
            exit 1
        case "STOP": 
            NF =  i - 1
    }
}

1
