{
    rows = $1
    for ($1=1; NF<=rows;) {
        print
        for (i = ++NF; i > 1; i--) $i += $(i - 1)
    }
}