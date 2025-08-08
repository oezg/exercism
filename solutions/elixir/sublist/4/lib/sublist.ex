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
  def compare(list, list), do: :equal

  def compare(a, b) when length(a) < length(b) do
    if sublist?(a, b) do
      :sublist
    else
      :unequal
    end
  end

  def compare(a, b) do
    if sublist?(b, a) do
      :superlist
    else
      :unequal
    end
  end

  defp sublist?(_a, []), do: false
  defp sublist?(a, [_h | t] = b), do: List.starts_with?(b, a) or sublist?(a, t)
end
