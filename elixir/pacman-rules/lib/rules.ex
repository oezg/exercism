defmodule Rules do
  @moduledoc """
  This is the Rules module.
  This module translates some rules from the classic game
  Pac-Man into Elixir functions.
  """

  @doc """
  Given two arguments if Pac-Man has a power pellet active
  and if Pac-Man is touching a ghost, return a boolean value
  if Pac-Man is able to eat the ghost.

  Returns true only if Pac-Man has a power pellet active
  and is touching a ghost.

  ## Examples

    iex> Rules.eat_ghost?(fakse, true)
    false
  """
  @doc since: "0.0.1"
  @spec eat_ghost?(boolean(), boolean()) :: boolean()
  def eat_ghost?(power_pellet_active?, touching_ghost?) do
    power_pellet_active? and touching_ghost?
  end

  @doc """
  Given two arguments if Pac-Man is touching a power pellet
  and if Pac-Man is touching a dot, return a boolean value
  if Pac-Man scored.

  Returns true if Pac-Man is touching a power pellet or a dot.

  ## Examples

    iex>Rules.score?(true, true)
    true
  """
  @spec score?(boolean(), boolean()) :: boolean()
  def score?(touching_power_pellet?, touching_dot?) do
    touching_power_pellet? or touching_dot?
  end

  @spec lose?(boolean(), boolean()) :: boolean()
  def lose?(power_pellet_active?, touching_ghost?) do
    touching_ghost? and not power_pellet_active?
  end

  @spec win?(boolean(), boolean(), boolean()) :: boolean()
  def win?(has_eaten_all_dots?, power_pellet_active?, touching_ghost?) do
    has_eaten_all_dots? and not lose?(power_pellet_active?, touching_ghost?)
  end
end
