def step:
  if . % 2 == 0 then . / 2 else . * 3 + 1 end;

def collatz:
  if last > 1 then [.[], last | step] | collatz end;

def validate:
  if . < 1 then "Only positive integers are allowed" | halt_error else [.] end;

def steps:
  validate | collatz | length - 1;