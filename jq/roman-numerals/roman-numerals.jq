include "digits";

def table: 
    {
        I: ["I", "X", "C", "M"], 
        V: ["V", "L", "D"], 
        X: ["X", "C", "M"]
    };

def toroman: 
    table.I.[.key] as $I
    | table.V.[.key] as $V
    | table.X.[.key] as $X
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
| [digits(10)] 
| reverse 
| to_entries 
| map(toroman) 
| reverse 
| add