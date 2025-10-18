function format(m) { printf("%02d:%02d", int(m / 60), m % 60) }

function equal(a, b) { print a == b ? "true" : "false" }

function modulo(a, b) { return (a % b + b) % b }

function create(h, m) { return modulo(h * 60 + m, 24 * 60) }

function add(n, m) { return create(0, n + m) }

$1 == "create" { format(create($2, $3)) }

$1 == "add" { format(add(create($2, $3), $4)) }

$1 == "subtract" { format(add(create($2, $3), -$4)) }

$1 == "equal" { equal(create($2, $3), create($4, $5)) }
