def starts_with_vowel:
    [startswith("a", "e", "i", "o", "u", "xr", "yt")] | any;

def strarts_with_qu:
    test("^[]")

def index_first_vowel:
    [index("a", "e", "i", "o", "u") // false] | min;

def rule2:
    index_first_vowel as $i 
    | if $i then .[$i:] + .[:$i] + "ay" else . + "ay" end;
def rule1: . + "ay";
def rule3: 

.phrase 
| if starts_with_vowel then 
    rule1 
elif starts_with_qu then 
    rule3
else
    rule2 
end