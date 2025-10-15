BEGIN { FPAT = "[[:alpha:]]" }

{
    $0 = tolower($0)
    delete letters

    for (i = 1; i <= NF; i++) letters[$i]

    print length(letters) == 26 ? "true" : "false"
}
