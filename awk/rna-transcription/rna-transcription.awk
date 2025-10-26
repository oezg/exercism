BEGIN {
    OFS = FS = ""
    transcription["A"] = "U"
    transcription["T"] = "A"
    transcription["C"] = "G"
    transcription["G"] = "C"
}

/[^ATCG]/ {
    print "Invalid nucleotide detected." > "/dev/stderr"
    exit 1
}

{
    for (dna = 1; dna <= NF; dna++) $dna = transcription[$dna]
}

1
