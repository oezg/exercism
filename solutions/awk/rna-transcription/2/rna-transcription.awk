BEGIN { OFS = FS = "" }

{
    for (dna = 1; dna <= NF; dna++) $dna = rna($dna)
}

1

function rna(dna) {
    switch (dna) {
        case "A":
            return "U"
        case "T":
            return "A"
        case "C":
            return "G"
        case "G":
            return "C"
    }

    print "Invalid nucleotide detected." > "/dev/stderr"
    exit 1
}
