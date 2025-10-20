{ d = sqrt($1 * $1 + $2 * $2) }

d <= 1 { print 10 }

1 < d && d <= 5 { print 5 }

5 < d && d <= 10 { print 1 }

10 < d { print 0 }
