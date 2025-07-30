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
      len_a == len_b -> if a == b, do: :equal, else: :unequal
      len_a > len_b -> if sublist?(b, a, len_b, len_a), do: :superlist, else: :unequal
      true -> if sublist?(a, b, len_a, len_b), do: :sublist, else: :unequal
    end
  end

  defp sublist?(_a, _b, len_a, len_b) when len_a > len_b, do: false

  defp sublist?(a, b, len_a, len_b) do
    strict_equals(a, Enum.slice(b, 0, len_a)) || sublist?(a, tl(b), len_a, len_b - 1)
  end

  defp strict_equals([], []), do: true
  defp strict_equals(_a, []), do: false
  defp strict_equals([], _b), do: false

  defp strict_equals([head_a | tail_a], [head_b | tail_b]) when head_a === head_b,
    do: strict_equals(tail_a, tail_b)

  defp strict_equals(_a, _b), do: false
end
