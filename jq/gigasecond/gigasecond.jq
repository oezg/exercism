.moment 
| 1e9 + ((strptime("%Y-%m-%d")? | mktime), (. + "Z" | fromdate?)) 
| todate[:-1]