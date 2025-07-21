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
  def search(numbers, key) do
    f = helper(numbers, key)
    f.(f, 0, tuple_size(numbers) - 1)
  end

  defp helper(numbers, key) do
    fn
      _f, left, right when left > right ->
        :not_found

      f, left, right ->
        middle = left + div(right - left, 2)

        case elem(numbers, middle) do
          ^key -> {:ok, middle}
          element when element < key -> f.(f, middle + 1, right)
          _ -> f.(f, left, middle - 1)
        end
    end
  end
end
