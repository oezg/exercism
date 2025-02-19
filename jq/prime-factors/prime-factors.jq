def factor: .factor = 2 | .factors = [];

def prime:
    if .value > 1 then
        if .factor > (.value | sqrt) then
            .factors += [.value]
        else
            if .value % .factor == 0 then
                .value = .value / .factor
                | .factors += [.factor]
            else 
                .factor += 1
            end
            | prime
        end
    end;

factor | prime | .factors