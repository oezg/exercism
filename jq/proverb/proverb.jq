def partition(size; step):
    def _partition:
        if length < size then
            empty
        else
            .[:size], (.[step:] | _partition)
        end;
    _partition;

.strings | if length > 0 then
    [
        (partition(2; 1) | "For want of a \(first) the \(last) was lost."),
        "And all for the want of a \(first)."
    ]
end