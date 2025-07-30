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
  def flatten(list, acc \\ [])
  def flatten([], acc), do: Enum.reverse(acc)
  def flatten([nil | tail], acc), do: flatten(tail, acc)
  def flatten([head | tail], acc) when is_list(head), do: flatten(head ++ tail, acc)
  def flatten([head | tail], acc), do: flatten(tail, [head | acc])
end
