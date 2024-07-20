Mix.install([:benchee])

# Compare access times to the elements in a Tuple, a Map, or a List containers.
#
# At first, we generate some input that is being used in the access_* functions:
# they go over each element and check if it is what we put there. One by one.

defmodule Accessor do
  @elements_n 10

  def generate_input() do
    {a_list, a_map} = Enum.reduce(0..@elements_n, {[], %{}}, fn i, {a_list, a_map} ->
      new_list = [i | a_list]
      new_map = Map.put(a_map, i, i)

      {new_list, new_map}
    end)

    a_list = Enum.reverse(a_list)
    a_tuple = List.to_tuple(a_list)

    {a_list, a_map, a_tuple}
  end

  def access_list(a_list) do
    Enum.each(0..@elements_n, fn i ->
      if Enum.at(a_list, i) != i, do: raise "wrong item in the list"
    end)
  end

  def access_map(a_map) do
    Enum.each(0..@elements_n, fn i ->
      if a_map[i] != i, do: raise "wrong item in the map"
    end)
  end

  def access_tuple(a_tuple) do
    Enum.each(0..@elements_n, fn i ->
      if elem(a_tuple, i) != i, do: raise "wrong item in the tuple"
    end)
  end
end

{a_list, a_map, a_tuple} = Accessor.generate_input()

Benchee.run(
  %{
    "list" => fn -> Accessor.access_list(a_list) end,
    "map" => fn -> Accessor.access_map(a_map) end,
    "tuple" => fn -> Accessor.access_tuple(a_tuple) end
  }
)
