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
      subseq?(a, b) -> :sublist
      subseq?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp subseq?([], _), do: true
  defp subseq?(_, []), do: false

  defp subseq?(a = [x | as], [x | bs]),
    do: if(List.starts_with?(bs, as), do: true, else: subseq?(a, bs))

  defp subseq?(a, [_ | bs]), do: subseq?(a, bs)
end
