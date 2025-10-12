/[^ATCG]/ {
    print "Invalid nucleotide detected." > "/dev/stderr"
    exit 1
}

{
    gsub("A", "U")
    gsub("T", "A")
    gsub("C", "_")
    gsub("G", "C")
    gsub("_", "G")
    print
}
