BEGIN {
    FPAT = "[\\[\\](){}]"
    opening["("] = ")"
    opening["["] = "]"
    opening["{"] = "}"
}

{
    for (bracket = 1; !mismatch && bracket <= NF; bracket++)
    if ($bracket in opening) stack[count++] = opening[$bracket]
    else if ($bracket == stack[--count]) delete stack[count]
    else mismatch = 1

    print mismatch || count ? "false" : "true"
}
