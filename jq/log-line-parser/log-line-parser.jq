def trim: sub("^\\s+"; "") | sub("\\s+$"; "");

# Task 1. Get message from a log line
def message:
  .[index(":")+1:] | trim
;

# Task 2. Get log level from a log line
def log_level:
  .[1:index("]")] | ascii_downcase
;

# Task 3. Reformat a log line
def reformat:
  "\(message) (\(log_level))"
;
