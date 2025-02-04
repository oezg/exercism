def turn_around:
    def tco:
        if .array | length == 0 then
            .result | implode
        else 
            .result = [.array | first] + .result
            | .array |= .[1:]
            | tco
        end;
    {"array": explode, "result": []} | tco;
        
def array_expansion:
    if length > 0 then 
        first as $h
        | [ .[1:] | array_expansion[], $h ] 
    end;

.value | explode | array_expansion | implode
# .value | turn_around