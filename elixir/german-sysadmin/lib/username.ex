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
  def sanitize([?ö | input]), do: [?o | [?e | sanitize(input)]]
  def sanitize([?ä | input]), do: [?a | [?e | sanitize(input)]]
  def sanitize([?ü | input]), do: [?u | [?e | sanitize(input)]]
  def sanitize([?ß | input]), do: [?s | [?s | sanitize(input)]]
  def sanitize([?_ | input]), do: [?_ | sanitize(input)]
  def sanitize([ch | input]) when ch in ?a..?z, do: [ch | sanitize(input)]
  def sanitize([ _ | input]), do: sanitize(input)
end
