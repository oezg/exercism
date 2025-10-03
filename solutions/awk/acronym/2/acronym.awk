BEGIN { FPAT = "[[:alpha:]][[:alpha:]']*" }

{
    for (i = 1; i <= NF; i++) ret = ret substr($i, 1, 1)

    print toupper(ret)
}
