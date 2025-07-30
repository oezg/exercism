defmodule Sublist do
  @moduledoc """
  Exercise on list comparison
  """

  @type list_comparison :: :equal | :sublist | :superlist | :unequal
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  @spec compare(a :: list, b :: list) :: list_comparison
  def compare(a, b) do
    len_a = length(a)
    len_b = length(b)

    cond do
      len_a == len_b -> if a === b, do: :equal, else: :unequal
      len_a > len_b -> if sublist?(b, a, len_a - len_b), do: :superlist, else: :unequal
      true -> if sublist?(a, b, len_b - len_a), do: :sublist, else: :unequal
    end
  end

  defp sublist?(a, b, 0), do: a === b

  defp sublist?(a, b, diff) do
    List.starts_with?(b, a) || sublist?(a, tl(b), diff - 1)
  end
end
