/total/ { print 2 ^ 64 - 1 }

/[[:digit:]]+/ {
    if ($0 < 1 || $0 > 64) {
        print "square must be between 1 and 64" > "/dev/stderr"

        exit 1
    }

    print 2 ^ ($0 - 1)
}
