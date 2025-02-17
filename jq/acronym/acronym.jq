def acronym:
    split("[\\s-]+"; null)
    | map(ltrimstr("_")[0:1] | ascii_upcase)
    | join("");

.phrase | acronym