def encode:
  "Implement this function" | halt_error;

def decode:
  "Implement this function" | halt_error;

if .property == "encode" then
    .input.string | encode
elif .property == "decode" then
    .input.string | decode
else
    .input.string | encode | decode
end