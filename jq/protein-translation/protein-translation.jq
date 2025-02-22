def chunk(size):
    def _chunk:
        if length < size then
            empty
        else
            .[]

def partition(size; step):
    def _partition:
        if length < size then
            empty
        else
            .[:size], (.[step:] | _partition)
        end;
    _partition;