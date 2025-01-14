def rest: .[1:];
def isempty: length == 0;

def array_add:
  if isempty then 0
  else first + (rest | array_add)
  end;

def array_reverse:
  if isempty then []
  else (rest | array_reverse) + [first]
  end;

def array_map(f):
  if isempty then []
  else [first | f] + (rest | array_map(f))
  end;
