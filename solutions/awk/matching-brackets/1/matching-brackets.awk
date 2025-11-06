BEGIN {
    FPAT = "[\\[\\](){}]"
    matching[")"] = "("
    matching["]"] = "["
    matching["}"] = "{"
}

{
    for (bracket = 1; bracket <= NF; bracket++) {
        if ($bracket ~ /[\[\(\{]/) stack[count++] = $bracket
        else if (matching[$bracket] == stack[count - 1]) delete stack[--count]
        else {
            print "false"
            exit
        }
    }

    print count ? "false" : "true"
}
