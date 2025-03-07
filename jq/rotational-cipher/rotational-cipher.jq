def lower: "abcdefghijklmnopqrstuvwxyz" / "";
def upper: lower | map(ascii_upcase);
def rotate(key): .[key:] + .[:key];
def plain: lower + upper;
def cipher(key): (lower | rotate(key)) + (upper | rotate(key));
def table(key): [plain, cipher(key)] | transpose | map({key: first, value:last}) | from_entries;

(.shiftKey % 26) as $key
| table($key) as $table
| .text / ""
| map($table[.] // .)
| add