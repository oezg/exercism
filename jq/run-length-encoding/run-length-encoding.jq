def reducer:
  reduce .[] as $x ([]; 
    if . == [] or last.value != $x then
      . + [{value: $x, count: 1}]
    else
      last.count += 1
    end);

def torna:
  "\(if .count > 1 then .count else "" end)\(.value)";

def ritorna:
  .value * (.count // "1" | tonumber);

def encode:
  . / "" | reducer | map(torna) | add // "";

def decode:
  [capture("(?<count>\\d+)?(?<value>[a-z ])"; "gi") | ritorna] | add // "";