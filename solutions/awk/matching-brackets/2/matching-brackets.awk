BEGIN {
    FPAT = "[\\[\\](){}]"
    matching[")"] = "("
    matching["]"] = "["
    matching["}"] = "{"
}

{
    for (bracket = 1; !flag && bracket <= NF; bracket++) {
        if ($bracket ~ /[[({]/) stack[count++] = $bracket
        else if (matching[$bracket] == stack[--count]) delete stack[count]
        else flag = 1
    }

    print flag || count  ? "false" : "true"
}
