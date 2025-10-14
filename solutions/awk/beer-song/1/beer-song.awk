BEGIN {
    if (verse != "" || verse != 0) print strophe(verse)
    else for (i = start; i >= stop; i--) print strophe(i)
}

function strophe(n) { return sprintf("%s\n%s", line1(n), line2(n)) }

function line1(n) {
    if (n == 0)
        return "No more bottles of beer on the wall, no more bottles of beer."

    s = n > 1 ? "s" : ""
    return n " bottle" s " of beer on the wall, " n " bottle" s " of beer."
}

function line2(n) {
    if (n == 0)
        return "Go to the store and buy some more, 99 bottles of beer on the wall."

    one = n == 1 ? "it" : "one"
    btls = (n == 1 ? "no more" : n - 1) " bottle" (n == 2 ? "" : "s")
    return "Take " one " down and pass it around, " btls " of beer on the wall."
}
