defmodule FlattenArray do
  @moduledoc """
  Take a nested array of any depth and return a fully flattened array.
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
  def flatten(list), do: flatten([list], [])

  defp flatten([[]], acc), do: Enum.reverse(acc)
  defp flatten([[] | work], acc), do: flatten(work, acc)
  defp flatten([[nil | tail] | work], acc), do: flatten([tail | work], acc)

  defp flatten([[head | tail] | work], acc) when is_list(head),
    do: flatten([head, tail | work], acc)

  defp flatten([[head | tail] | work], acc), do: flatten([tail | work], [head | acc])
end
