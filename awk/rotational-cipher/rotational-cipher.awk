@load "ordchr"

BEGIN { OFS = FS = "" }

{
    for (i = 1; i <= NF; i++) 
    printf $i ~ /[[:alpha:]]/ ? rotate(ord($i ~ /[[:lower:]]/ ? "a" : "A")) : $i
}

function rotate(start) { return chr((ord($i) + distance - start) % 26 + start) }
