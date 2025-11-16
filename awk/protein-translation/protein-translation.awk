BEGIN { RS = ".{3}" }

# RT ~ /(?!AUG|UUU|UUC|UUA|UUG|UCU|UCC|UCA|UCG|UAU|UAC|UGU|UGC|UGG|UAA|UAG|UGA)/ {
#     error = 1
#     exit 1
# }
RT ~ /AUG/ { translate("Methionine") }

RT ~ /(UUU|UUC)/ { translate("Phenylalanine") }

RT ~ /(UUA|UUG)/ { translate("Leucine") }

RT ~ /(UCU|UCC|UCA|UCG)/ { translate("Serine") }

RT ~ /(UAU|UAC)/ { translate("Tyrosine") }

RT ~ /(UGU|UGC)/ { translate("Cysteine") }

RT ~ /UGG/ { translate("Tryptophan") }

RT ~ /(UAA|UAG|UGA)/ { exit 0 }

RT || NF {
    error = 1
    exit 1
}

function translate(amino) {
    protein[NR] = amino
    next
}

END {
    if (error) {
        print "Invalid codon"
        exit 1
    }

    for (i = 1; i <= NR; i++)
    if (protein[i]) printf("%s%s", i > 1 ? " " : "", protein[i])
}
