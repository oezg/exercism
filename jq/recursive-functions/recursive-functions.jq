def rest: .[1:];
def isempty: length == 0;

def array_add:
  def tco:
    if .array | isempty 
      then .result 
      else .result += (.array | first) | .array = (.array | rest) | tco 
    end;
  {array: ., result: 0} | tco;

def array_reverse:
  def tco:
    if .array | isempty 
      then .result 
      else .result = [.array | first] + .result | .array = (.array | rest) | tco 
    end;
  {array: ., result: []} | tco;
  
def array_map(f):
  def tco:
    if .array | isempty 
      then .result 
      else .result += [.array | first | f] | .array = (.array | rest) | tco 
    end;
  {array: ., result: []} | tco;