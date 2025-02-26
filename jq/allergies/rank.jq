def rank:
    {
        "name": "cats",
        "value": 128
    },
    {
        "name": "pollen",
        "value": 64
    },
    {
        "name": "chocolate",
        "value": 32
    },
    {
        "name": "tomatoes",
        "value": 16
    },
    {
        "name": "strawberries",
        "value": 8
    },
    {
        "name": "shellfish",
        "value": 4
    },
    {
        "name": "peanuts",
        "value": 2
    },
    {
        "name": "eggs",
        "value": 1
    };

def sum_allergen_values:
    [rank | .value] | add + 1;