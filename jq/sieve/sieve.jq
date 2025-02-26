(.limit + 1) as $length
| [false, false, (range(2; $length) | true)]
| .[range(4; $length; 2)] = false
| reduce range(3; $length | sqrt; 2) as $i (.; if .[$i] then .[range(2 * $i; $length; $i)] = false end)
| indices(true)