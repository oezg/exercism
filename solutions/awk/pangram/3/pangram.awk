BEGIN { FPAT = "[[:alpha:]]" }

{
    $0 = tolower($0)

    for (i = 1; i <= NF; i++) letters[$i] = 0

    print length(letters) == 26 ? "true" : "false"
}
