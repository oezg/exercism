defmodule Username do
  @spec sanitize(username :: charlist()) :: charlist()
  def sanitize(~c""), do: ~c""

  def sanitize([first_letter | rest]) when first_letter in ?a..?z,
    do: [first_letter | sanitize(rest)]

  def sanitize([?ä | rest]), do: ~c"ae" ++ sanitize(rest)
  def sanitize([?ö | rest]), do: ~c"oe" ++ sanitize(rest)
  def sanitize([?ü | rest]), do: ~c"ue" ++ sanitize(rest)
  def sanitize([?ß | rest]), do: ~c"ss" ++ sanitize(rest)
  def sanitize([?_ | rest]), do: [?_ | sanitize(rest)]
  def sanitize([_ | rest]), do: sanitize(rest)
end
