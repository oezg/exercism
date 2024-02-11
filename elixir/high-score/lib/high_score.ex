defmodule HighScore do
  @default_initial_score 0

  @spec new() :: %{}
  def new(),
    do: Map.new()

  @spec add_player(map(), String.t(), integer()) :: map()
  def add_player(scores, name, score \\ @default_initial_score),
    do: Map.put_new(scores, name, score)

  @spec remove_player(map(), String.t()) :: map()
  def remove_player(scores, name),
    do: Map.delete(scores, name)

  @spec reset_score(map(), String.t()) :: map()
  def reset_score(scores, name),
    do: Map.put(scores, name, @default_initial_score)

  @spec update_score(map(), String.t(), number()) :: map()
  def update_score(scores, name, score),
    do: Map.update(scores, name, score, fn current -> score + current end)

  @spec get_players(map()) :: list()
  def get_players(scores),
    do: Map.keys(scores)
end
