{ distance = sqrt($1 * $1 + $2 * $2) }

distance <= 1 { print 10 }

1 < distance && distance <= 5 { print 5 }

5 < distance && distance <= 10 { print 1 }

10 < distance { print 0 }
