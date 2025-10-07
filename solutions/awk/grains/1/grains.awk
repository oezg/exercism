/total/ {
    print 2 ^ 64 - 1
    next
}

$0 < 65 && $0 > 0 {
    print 2 ^ ($0 - 1)
    next
}

{
    print "square must be between 1 and 64"

    exit 1
}
