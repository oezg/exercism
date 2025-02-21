(.lines | map(length)) as $lengths
| .lines
| to_entries
| map(.value + " " * (($lengths[.key:] | max) - $lengths[.key]))
| map(. / "")
| transpose
| map(add)