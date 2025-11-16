# BEGIN { ORS = "" }
/AUG/ { druck("Methionine") }

/(UUU|UUC)/ { druck("Phenylalanine") }

/(UUA|UUG)/ { druck("Leucine") }

/(UCU|UCC|UCA|UCG)/ { druck("Serine") }

/(UAU|UAC)/ { druck("Tyrosine") }

/(UGU|UGC)/ { druck("Cysteine") }

/UGG/ { druck("Tryptophan") }

/(UAA|UAG|UGA)/ { exit 0 }

# $0 {
#     print "Invalid codon" > "/dev/stderr"
#     exit 1
# }
function druck(pp) {
    # out[NR] = pp
    # print (NR > 1 ? " " : "") pp
    print pp
    next
}
