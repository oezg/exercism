def rest: .[1:];
def isempty: length == 0;
def second: .[1];

def master(array_add; array_reverse; array_map; fun):
  def tco:
    if second | isempty
      then first 
    else
      if array_reverse
        then .[0] = [second | first] + first
      elif array_add
        then .[0] += (second | first)
      else .[0] += [second | first | fun]
      end | .[1] = (second | rest) | tco
    end;
  [(if array_add then 0 else [] end), .] | tco;

def array_add:
  master(true; false; false; null);

def array_reverse:
  master(false; true; false; null);
  
def array_map(f):
  master(false; false; true; f);
