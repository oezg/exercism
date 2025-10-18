function format(m) { printf("%02d:%02d", m / 60, m % 60) }

function equal(a, b) { print a == b ? "true" : "false" }

function modulo(a, b) { return (a % b + b) % b }

function create(h, m) { return modulo(h * 60 + m, 24 * 60) }

$1 == "create" { format(create($2, $3)) }

$1 == "add" { format(create($2, $3 + $4)) }

$1 == "subtract" { format(create($2, $3 - $4)) }

$1 == "equal" { equal(create($2, $3), create($4, $5)) }
