defmodule Sublist do
  @moduledoc false

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare(list(), list()) :: :equal | :sublist | :superlist | :unequal
  def compare(a, a), do: :equal

  def compare(a, b) do
    cond do
      length(a) < length(b) and subsequence?(a, b) -> :sublist
      length(b) < length(a) and subsequence?(b, a) -> :superlist
      true -> :unequal
    end
  end

  @spec subsequence?(list(), list()) :: boolean()
  defp subsequence?([], _), do: true
  defp subsequence?(_, []), do: false

  defp subsequence?([x | _xs] = a, [y | ys] = b) do
    if x === y and compare(a, Enum.slice(b, 0, length(a))) == :equal do
      true
    else
      subsequence?(a, ys)
    end
  end
end
