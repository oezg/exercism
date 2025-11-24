@load "ordchr"

BEGIN { OFS = FS = "" }

{
    for (i = 1; i <= NF; i++) switch ($i) {
        case /[[:lower:]]/: rotate(ord("a")); break;
        case /[[:upper:]]/: rotate(ord("A")); break;
    }
}

1

function rotate(start) { $i = chr((ord($i) + distance - start) % 26 + start) }
