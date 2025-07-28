defmodule Username do
  @moduledoc """
  Exercise to learn `case` and `charlist`s.
  """

  @doc """
  Create sanitized aliases for all email accounts in German.
  """
  @spec sanitize(username :: charlist()) :: charlist()
  def sanitize(username) do
    Enum.flat_map(username, fn
      lower_letter when lower_letter in ?a..?z -> [lower_letter]
      ?_ -> ~c"_"
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      _ -> []
    end)
  end
end
