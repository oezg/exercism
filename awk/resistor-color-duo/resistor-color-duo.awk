@include "../util"

BEGIN {
    colors["black"] = 0
    colors["brown"] = 1
    colors["red"] = 2
    colors["orange"] = 3
    colors["yellow"] = 4
    colors["green"] = 5
    colors["blue"] = 6
    colors["violet"] = 7
    colors["grey"] = 8
    colors["white"] = 9
}

{
    assert($1 in colors && $2 in colors, "invalid color")
    print 10 * colors[$1] + colors[$2]
}
