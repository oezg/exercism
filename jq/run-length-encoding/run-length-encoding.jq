def reducer:
  reduce .[] as $x ([]; 
    if . == [] or last.value != $x then
      . + [{value: $x, count: 1}]
    else
      last.count += 1
    end);

def torna:
  if .count == 1 then 
    .value
  else 
    "\(.count)\(.value)"
  end;

def ritorna:
  if .count == null then 
    .value
  else
    .value as $value
    | [range(.count | tonumber) | $value] 
    | add
  end;

def encode:
  . / "" | reducer | map(torna) | add // "";

def decode:
  [capture("(?<count>\\d+)?(?<value>[a-z ])"; "gi") | ritorna] | add // "";