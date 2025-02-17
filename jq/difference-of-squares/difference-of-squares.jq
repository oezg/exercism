def sum_of_squares:
    . * (. + 1) * (. * 2 + 1) / 6;

def square_of_sums:
    pow(. * (. + 1) / 2; 2);

.input.number as $number
| if .property == "differenceOfSquares" then 
    ($number | square_of_sums) - ($number | sum_of_squares)
elif .property == "squareOfSum" then
    $number | square_of_sums
else 
    $number | sum_of_squares
end