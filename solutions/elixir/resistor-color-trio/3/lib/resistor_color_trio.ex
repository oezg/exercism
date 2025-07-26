defmodule ResistorColorTrio do
  @giga 1_000_000_000
  @mega 1_000_000
  @kilo 1_000

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    apply(
      &with_prefix((10 * &1 + &2) * Integer.pow(10, &3)),
      colors |> Enum.take(3) |> Enum.map(&code/1)
    )
  end

  defp with_prefix(value) when value >= @giga, do: {div(value, @giga), :gigaohms}
  defp with_prefix(value) when value >= @mega, do: {div(value, @mega), :megaohms}
  defp with_prefix(value) when value >= @kilo, do: {div(value, @kilo), :kiloohms}
  defp with_prefix(value), do: {value, :ohms}

  @spec code(atom) :: integer
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
