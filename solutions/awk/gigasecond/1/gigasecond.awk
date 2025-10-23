BEGIN { FPAT = "[[:digit:]]+" }

NF {
    while (i < 6) datespec = datespec " " ($++i ? $i : 0)

    timestamp = mktime(datespec, "UTC") + 1e9
    print strftime("%FT%T", timestamp, "UTC")
}
