$0 == "total" { print 2 ^ 64 - 1 }

$0 < 65 && $0 > 0 { print 2 ^ ($0 - 1) }

$0 != "total" && ($0 < 1 || $0 > 64) {
    print "square must be between 1 and 64" > "/dev/stderr"

    exit 1
}
