invalid() {
    print "invalid" > "/dev/stderr"
    exit 1
}

{ print can_attack() ? "true" : "false" }

function can_attack() { return $1 == $3 || $2 == $4 || diagonal() }

function diagonal() { return abs($4 - $2) == abs($3 - $1) }

function abs(x) { return x < 0 ? -x : x }

function invalid() {
    for (i = 1; i <= NF; i++)
        if ($i < 0 || $i > 7) return 1
    return $1 == $3 && $2 == $4
}
