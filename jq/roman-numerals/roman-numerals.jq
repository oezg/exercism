def toroman: 
    ["I", "X", "C", "M"][.key] as $I
    | ["V", "L", "D"][.key] as $V
    | ["X", "C", "M"][.key] as $X
    | [
        "", 
        "\($I)", 
        "\($I)\($I)", 
        "\($I)\($I)\($I)", 
        "\($I)\($V)", 
        "\($V)", 
        "\($V)\($I)", 
        "\($V)\($I)\($I)", 
        "\($V)\($I)\($I)\($I)",
        "\($I)\($X)"
    ][.value];

.number 
| if . == 0 then [0] else [while(. > 0; . /= 10 | floor) | . % 10] end
| to_entries 
| map(toroman) 
| reverse 
| add