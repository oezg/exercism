@load "ordchr"

BEGIN { OFS = FS = "" }

{
    for (i = 1; i <= NF; i++) {
        if ("a" <= $i && $i <= "z") rotate(ord("a"))

        if ("A" <= $i && $i <= "Z") rotate(ord("A"))
    }
}

1

function rotate(start) { $i = chr((ord($i) + distance - start) % 26 + start) }
