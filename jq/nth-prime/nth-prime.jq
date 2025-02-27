def is_prime:
    all(. % range(3; sqrt + 1; 2); . > 0); 

def next_prime: 
    . + 2 | until(is_prime; . + 2);

if $n == 0 then "there is no zeroth prime" | halt_error
elif $n == 1 then 2
else 
    {n: 2, prime: 3} 
    | until(.n == $n; .prime |= next_prime | .n += 1)
    | .prime
end