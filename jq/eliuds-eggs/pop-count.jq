def count_set_bits:
    if .number > 0 then
        .count += .number % 2
        | .number |= (. / 2 | floor)
        | count_set_bits
    end;

.count = 0 | count_set_bits | .count
