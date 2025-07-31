defmodule FlattenArray do
  @moduledoc """
  Take a nested array of any depth and return a fully flattened array.

  Use work stack algorithm, Time Complexity: O(N).
  """

  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1, 2, 3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list), do: flatten(list, [], [])

  defp flatten([], [], acc), do: Enum.reverse(acc)
  defp flatten([], [top | stack], acc), do: flatten(top, stack, acc)
  defp flatten([nil | tail], stack, acc), do: flatten(tail, stack, acc)

  defp flatten([head | tail], stack, acc) when is_list(head),
    do: flatten(head, [tail | stack], acc)

  defp flatten([head | tail], stack, acc), do: flatten(tail, stack, [head | acc])
end
