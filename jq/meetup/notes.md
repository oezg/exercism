If day is zero, time goes to the last day of the previous month. Negative values go further back in time.

```jq
jq -nc '"2025-02-27" | strptime("%Y-%m-%d")'
[2025,1,27,0,0,0,4,57]

jq -n '"2025-02-27" | strptime("%Y-%m-%d") | .[2] = 0 | mktime | strftime("%Y-%m-%d")'
"2025-01-31"

jq -n '"2025-02-27" | strptime("%Y-%m-%d") | .[2] = -1 | mktime | strftime("%Y-%m-%d")'
"2025-01-30"
```
