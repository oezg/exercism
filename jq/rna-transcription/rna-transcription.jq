def transcr:
  {"65": 85, "67": 71, "71": 67, "84": 65}[tostring];

def toRna:
  explode | map(transcr) | implode;
