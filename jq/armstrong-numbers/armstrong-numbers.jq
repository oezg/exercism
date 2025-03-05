def is(value): . == value;

def armstrong:
    [pow(while(. > 0; . / 10 | floor) % 10; log10 | floor + 1)]
    | add // 0;

.number | is(armstrong)