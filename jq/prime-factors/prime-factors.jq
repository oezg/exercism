def factors:
    .range = [.value | sqrt | floor | range(2; . + 1)]
    | .factors = [];

def primes:
    if .value > 1 then
        if .range == [] then
            .factors += [.value]
        else
            (.range | first) as $head
            | if .value % $head == 0 then
                .value |= . / $head
                | .factors += [$head]
            else
                .range |= .[1:]
            end
            | primes
        end
    end;

factors | primes | .factors