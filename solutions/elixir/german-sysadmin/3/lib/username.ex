defmodule Username do
  @spec sanitize(username :: charlist()) :: charlist()
  def sanitize(~c""), do: ~c""

  def sanitize([first_letter | rest]) do
    case first_letter do
      lower_letter when lower_letter in ?a..?z -> [lower_letter | sanitize(rest)]
      ?_ -> [?_ | sanitize(rest)]
      ?ä -> [?a, ?e | sanitize(rest)]
      ?ö -> [?o, ?e | sanitize(rest)]
      ?ü -> [?u, ?e | sanitize(rest)]
      ?ß -> [?s, ?s | sanitize(rest)]
      _ -> sanitize(rest)
    end
  end
end
