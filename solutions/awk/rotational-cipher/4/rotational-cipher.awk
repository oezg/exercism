@load "ordchr"

BEGIN { OFS = FS = "" }

{
    for (i = 1; i <= NF; i++)
    if ($i ~ /[[:alpha:]]/) {
        start = ord($i ~ /[[:lower:]]/ ? "a" : "A")
        $i = chr((ord($i) + distance - start) % 26 + start)
    }
}

1
