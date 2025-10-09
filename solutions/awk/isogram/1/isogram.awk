BEGIN { FS = "" }

{ $0 = tolower($0) }

{
    for (i = 1; i <= NF && !flag; i++) {
        if ($i in arr) flag = 1
        else if ($i != "-" && $i != " ") arr[$i] = 1
    }
}

{ print flag ? "false" : "true" }
