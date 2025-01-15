def rest: .[1:];
def isempty: length == 0;

def array_add:
  first + 
  if isempty 
    then 0
    else (rest | array_add)
  end;

def array_reverse:
  if isempty 
    then []
    else (rest | array_reverse)
  end 
  + [first // empty];

def array_map(f):
  def _map:
    [first // empty | f] + 
    if isempty 
      then []
      else (rest | _map)
    end;
  _map;
