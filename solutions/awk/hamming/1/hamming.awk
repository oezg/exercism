NR == 1 { strandA = $0 }

NR == 2 { strandB = $0 }

END {
    if (length(strandA) != length(strandB)) {
        fail("strands must be of equal length")
    }

    split(strandA, charsA, "")
    split(strandB, charsB, "")
    distance = 0

    for (i = 1; i <= length(charsA); i++)
    if (charsA[i] != charsB[i]) distance++

    print distance
}

function fail(message) {
    print message > "/dev/stderr"
    exit 1
}
