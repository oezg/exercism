defmodule Username do
  @moduledoc """
  A learn exercise for Charlist and Case by creating sanitized aliases for german email accounts.
  """

  @doc """
  Sanitize existing usernames by removing everything but lowercase letters.
  Allow underscores.
  Substitute German characters. ä: ae, ö: oe, ü: ue, ß: ss.

  ## Examples:

    iex> Username.sanitize(~c"schmidt1985")
    ~c"schmidt"

    iex> Username.sanitize(~c"mark_fischer$$$")
    ~c"mark_fischer"

    iex> Username.sanitize(~c"cäcilie_weiß")
    ~c"caecilie_weiss"

  """
  @spec sanitize(charlist()) :: charlist()
  def sanitize([]), do: []
  def sanitize([head | tail]) do
    replacement = case head do
      ?ö -> ~c"oe"
      ?ä -> ~c"ae"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      ?_ -> ~c"_"
      lower_ascii_letter when lower_ascii_letter in ?a..?z -> [lower_ascii_letter]
      _ -> ~c""
    end
    replacement ++ sanitize(tail)
  end
end
