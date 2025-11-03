BEGIN { FPAT = "[^-]" }

{
    print NF != 10 || /[^[:digit:]X-]/ || /X/ && $10 != "X" || isb() % 11 ? "false" : "true"
}

function isb(n) {
    for (i = 1; i <= NF; i++) n += $i == "X" ? 10 : $i * (11 - i)

    return n
}
