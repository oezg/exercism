BEGIN { FS = "," }

{
    command = $1
    print @command($2)
}

function difference(n) { return square_of_sum(n) - sum_of_squares(n) }

function square_of_sum(n) { return (n * (n + 1) / 2) ^ 2 }

function sum_of_squares(n) { return n * (n + 1) * (2 * n + 1) / 6 }
