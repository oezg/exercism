defmodule Username do
  @spec sanitize(username :: charlist()) :: charlist()
  def sanitize(~c""), do: ~c""

  def sanitize([first_letter | rest]) do
    case first_letter do
      lower_letter when lower_letter in ?a..?z -> [lower_letter]
      ?_ -> ~c"_"
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      _ -> ~c""
    end ++ sanitize(rest)
  end
end
