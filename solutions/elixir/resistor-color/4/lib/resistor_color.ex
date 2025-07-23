defmodule ResistorColor do
  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @type t() :: unquote(Enum.reduce(Map.keys(@colors), &quote(do: unquote(&1) | unquote(&2))))

  @doc """
  Return the value of a color band
  """
  @spec code(ResistorColor.t()) :: integer()
  for {color, value} <- @colors do
    def code(unquote(color)), do: unquote(value)
  end
end
