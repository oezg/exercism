defmodule ResistorColorTrio do
  @giga 1_000_000_000
  @mega 1_000_000
  @kilo 1_000

  @type ohms :: :ohms | :kiloohms | :megaohms | :gigaohms
  @type color ::
          :black | :brown | :red | :orange | :yellow | :green | :blue | :violet | :grey | :white

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [color]) :: {integer, ohms}
  def label([first, second, third | _rest]) do
    value = (10 * code(first) + code(second)) * 10 ** code(third)
    with_ohms(value)
  end

  @spec with_ohms(value :: number) :: {integer, ohms}
  defp with_ohms(value) when value >= @giga, do: {div(value, @giga), :gigaohms}
  defp with_ohms(value) when value >= @mega, do: {div(value, @mega), :megaohms}
  defp with_ohms(value) when value >= @kilo, do: {div(value, @kilo), :kiloohms}
  defp with_ohms(value), do: {value, :ohms}

  @spec code(color) :: integer
  defp code(:black), do: 0
  defp code(:brown), do: 1
  defp code(:red), do: 2
  defp code(:orange), do: 3
  defp code(:yellow), do: 4
  defp code(:green), do: 5
  defp code(:blue), do: 6
  defp code(:violet), do: 7
  defp code(:grey), do: 8
  defp code(:white), do: 9
end
