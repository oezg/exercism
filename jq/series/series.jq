def fail_when(condition; message):
    if condition then message | halt_error end;

def validate(series_length; slice_length):
    fail_when(series_length == 0; "series cannot be empty")
    | fail_when(slice_length < 0; "slice length cannot be negative")
    | fail_when(slice_length == 0; "slice length cannot be zero")
    | fail_when(series_length < slice_length; "slice length cannot be greater than series length");

.series as $series
| ($series | length) as $series_length
| .sliceLength as $slice_length
| validate($series_length; $slice_length)
| [range($series_length - $slice_length + 1) | $series[. : . + $slice_length]]