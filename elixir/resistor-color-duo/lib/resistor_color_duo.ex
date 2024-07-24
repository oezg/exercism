defmodule ResistorColorDuo do
  @moduledoc false

  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(bands),
    do: bands |> Enum.take(2) |> Enum.map(&band_value/1) |> Integer.undigits()

  def value_conventional([band1, band2 | _]), do: band_value(band1) * 10 + band_value(band2)

  @spec band_value(color :: atom) :: integer
  defp band_value(:black), do: 0
  defp band_value(:brown), do: 1
  defp band_value(:red), do: 2
  defp band_value(:orange), do: 3
  defp band_value(:yellow), do: 4
  defp band_value(:green), do: 5
  defp band_value(:blue), do: 6
  defp band_value(:violet), do: 7
  defp band_value(:grey), do: 8
  defp band_value(:white), do: 9
end
