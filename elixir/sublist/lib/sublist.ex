defmodule Sublist do
  @moduledoc false

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare(list(), list()) :: :equal | :sublist | :superlist | :unequal
  def compare(a, b) do
    cond do
      a === b -> :equal
      subsequence?(b, a) -> :sublist
      subsequence?(a, b) -> :superlist
      :else -> :unequal
    end
  end

  @spec subsequence?(list(), list()) :: boolean()
  defp subsequence?(superlist, sublist)
  defp subsequence?(_, []), do: true
  defp subsequence?([], _), do: false

  defp subsequence?([x | list], [x | prefix] = sublist),
    do: List.starts_with?(list, prefix) or subsequence?(list, sublist)

  defp subsequence?([_ | list], sublist), do: subsequence?(list, sublist)
end
