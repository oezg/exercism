BEGIN { FS = "," }

{
    average = (($3 $4) + ($5 $6)) / 2
    print "#" $1 ", " $2 " = " average
}
