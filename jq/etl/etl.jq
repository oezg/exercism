def value_to_key(key):
    map({key: (. | ascii_downcase), value: (key | tonumber)});

def letter_to_number:
    .key as $key | .value | value_to_key($key);

.legacy
| to_entries
| map(letter_to_number)
| flatten
| from_entries