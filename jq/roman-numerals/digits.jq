def negative: . < 0;
def zero: . == 0;
def integer: . == floor;

def digits(base):
    def _digits:
        if zero then
            empty
        else
            (. / base | floor | _digits), . % base
        end;
    if negative or (integer | not) then
        "Implemented only for non-negative integers" | error
    elif zero then
        0
    else
        _digits
    end;
