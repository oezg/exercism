def next_row($idx): [0, .[]] | .[$idx:$idx+2] | add;

.count as $n
| [[1] | while(length <= $n; [next_row(range(length+1))])]