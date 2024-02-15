defmodule RPG.CharacterSheet do
  @moduledoc """
  To help new people with character creation, a small program that will guide them through the process.
  """

  @doc """
  Welcome the new player.
  """
  @spec welcome() :: :ok
  def welcome(), do:
    IO.puts("Welcome! Let's fill out your character sheet together.")

  @doc """
  Ask for the character's name.
  """
  @spec ask_name() :: String.t()
  def ask_name(), do:
    ask_something("name")

  @doc """
  Ask for the character's class.
  """
  @spec ask_class() :: String.t()
  def ask_class(), do:
    ask_something("class")

  @doc """
  Ask for the character's level.
  """
  @spec ask_level() :: integer()
  def ask_level(), do:
    ask_something("level")
    |> Integer.parse()
    |> elem(0)

  @spec ask_something(something :: String.t()) :: String.t()
  defp ask_something(something), do:
    String.trim(IO.gets("What is your character's #{something}?\n"))

  @doc """
  Welcome the new player, ask for the character's name, class, and level.
  Print the map with the label "Your character".
  Return the character sheet as a map.
  """
  @spec run() :: %{name: String.t(), class: String.t(), level: integer()}
  def run(), do:
    %{
      name: welcome() && ask_name(),
      class: ask_class(),
      level: ask_level(),
    }
    |> IO.inspect(label: "Your character")
end
