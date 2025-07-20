defmodule BinarySearch do
  @moduledoc false
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key), do: search(numbers, key, 0, tuple_size(numbers) - 1)

  defp search(_numbers, _key, left, right) when left > right, do: :not_found

  defp search(numbers, key, left, right) do
    middle = left + div(right - left, 2)

    case elem(numbers, middle) do
      ^key ->
        {:ok, middle}

      element when element < key ->
        search(numbers, key, middle + 1, right)

      _ ->
        search(numbers, key, left, middle - 1)
    end
  end
end
