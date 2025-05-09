# input: a floating point number
# output: the number rounded to two decimal places
def two_decimal: ((. * 100) | round) / 100;

def earth_year: 31557600;

def orbits:
    {
        Mercury: 0.2408467,
        Venus: 0.61519726,
        Earth: 1.0,
        Mars: 1.8808158,
        Jupiter: 11.862615,
        Saturn: 29.447498,
        Uranus: 84.016846,
        Neptune: 164.79132
    };

def validate:
    if in(orbits) then orbits[.] else "not a planet" | halt_error end;

.seconds / earth_year / (.planet | validate) | two_decimal