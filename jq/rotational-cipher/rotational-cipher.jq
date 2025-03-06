def lower: "abcdefghijklmnopqrstuvwxyz" / "";
def upper: lower | map(ascii_upcase);
def rotate(key): .[key:] + .[:key];
def plain: lower + upper;
def cipher(key): (lower | rotate(key)) + (upper | rotate(key));
def position: . as $t | plain | index($t);
def translate(key): cipher(key)[position]? // .;


(.shiftKey % 26) as $key
| .text / ""
| map(translate($key))
| add