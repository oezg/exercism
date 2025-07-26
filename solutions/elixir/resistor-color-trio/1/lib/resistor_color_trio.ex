defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([first, second, third | _rest]) do
    value = (10 * code(first) + code(second)) * Integer.pow(10, code(third))

    cond do
      value > 1_000_000_000 ->
        {div(value, 1_000_000_000), :gigaohms}

      value > 1_000_000 ->
        {div(value, 1_000_000), :megaohms}

      value > 1_000 ->
        {div(value, 1_000), :kiloohms}

      true ->
        {value, :ohms}
    end
  end

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
