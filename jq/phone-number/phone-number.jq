def fail_when(condition; message):
    if condition then message | halt_error end;

def exchange_starts(prefix): .[3:6] | startswith(prefix);

def validate:
    if length == 11 and startswith("1") then .[1:] | validate end
    | fail_when(length == 11; "11 digits must start with 1")
    | fail_when(length < 10; "must not be fewer than 10 digits")
    | fail_when(length > 11; "must not be greater than 11 digits")
    | fail_when(test("\\p{L}"); "letters not permitted")
    | fail_when(test("\\p{P}"); "punctuations not permitted")
    | fail_when(startswith("0"); "area code cannot start with zero")
    | fail_when(startswith("1"); "area code cannot start with one")
    | fail_when(exchange_starts("0"); "exchange code cannot start with zero")
    | fail_when(exchange_starts("1"); "exchange code cannot start with one");

def clean: ltrimstr("+") | gsub("[- .()]"; "");

.phrase | clean | validate 