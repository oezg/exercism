defmodule ResistorColor do
  @moduledoc """
  A helpful program so that you don't have to remember the values of the bands.
  """

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

  @doc """
  Return the value of a color band
  """
  @spec code(atom) :: integer()
  def code(color), do: @colors[color]
end
