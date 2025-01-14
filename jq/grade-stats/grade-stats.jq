def letter_grade:
  if   IN(range(0; 60))   then "F"
  elif IN(range(60; 70))  then "D"
  elif IN(range(70; 80))  then "C"
  elif IN(range(80; 90))  then "B"
  elif IN(range(90; 101)) then "A"
  else empty end;

def count_letter_grades:
  reduce .[] as $grade ({"A":0, "B":0, "C":0, "D":0, "F":0}; .[$grade | letter_grade] += 1);
