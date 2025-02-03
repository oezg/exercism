def table: {"A": "U", "C": "G", "G": "C", "T": "A"};

def toRna:
  explode
  | map([.] | implode | table[.])
  | reduce .[] as $item (""; . + $item);
