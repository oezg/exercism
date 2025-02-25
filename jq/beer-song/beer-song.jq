def if_n(n; $then; $else):
    if . == n then $then else $else end;

def bottles:
    if_n(0; "no more"; "\(.)") + " bottle" + if_n(1; ""; "s");

def first_line:
    "\(bottles) of beer on the wall, \(bottles) of beer." | sub("^n"; "N");

def second_line:
    if_n(0; "Go to the store and buy some more, 99 bottles of beer on the wall.";
    "Take " + if_n(1; "it"; "one") + " down and pass it around, \(. - 1 | bottles) of beer on the wall.");

[range(.startBottles; .startBottles - .takeDown; -1)
| "", first_line, second_line][1:]