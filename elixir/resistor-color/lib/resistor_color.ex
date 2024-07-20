defmodule ResistorColor do
  @moduledoc """
  A helpful program so that you don't have to remember the values of the bands.
  """

  @colors {
    :black,
    :brown,
    :red,
    :orange,
    :yellow,
    :green,
    :blue,
    :violet,
    :grey,
    :white
  }

  @doc """
  Return the value of a color band
  """
  @spec code(atom) :: integer()
  def code(color), do: Enum.find(0..(tuple_size(@colors) - 1), &(elem(@colors, &1) == color))
end
