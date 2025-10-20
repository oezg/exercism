in_circle("inner") { print 10 }

in_circle("middle") { print 5 }

in_circle("outer") { print 1 }

in_circle() { print 0 }

function in_circle(x) {
    d = sqrt($1 * $1 + $2 * $2)

    switch (x) {
        case "inner":
            return 0 <= d && d <= 1
        case "middle":
            return 1 < d && d <= 5
        case "outer":
            return 5 < d && d <= 10
        default:
            return d > 10
    }
}
