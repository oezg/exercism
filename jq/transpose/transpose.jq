.lines
| map(. / "")
| transpose
| map(until(last != null; .[:-1]) | map(. // " ") | add)