def acronym:
    gsub("[^a-zA-Z\\s-]"; "")
    | gsub("[\\s-]+"; "-")
    | split("-")
    | map(.[0:1])
    | join("")
    | ascii_upcase;

.phrase | acronym