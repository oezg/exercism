defmodule RPG.CharacterSheet do
  @moduledoc """
  To help new people with character creation, a small program that will guide them through the process.
  """

  @doc """
  Welcome the new player.
  """
  @spec welcome() :: :ok
  def welcome(), do: IO.puts("Welcome! Let's fill out your character sheet together.")

  @doc """
  Ask for the character's name.
  """
  @spec ask_name() :: String.t()
  def ask_name(), do: ask_for_characters("name")

  @doc """
  Ask for the character's class.
  """
  @spec ask_class() :: String.t()
  def ask_class(), do: ask_for_characters("class")

  @spec ask_for_characters(something :: String.t()) :: String.t()
  defp ask_for_characters(something), do: String.trim(IO.gets("What is your character's #{something}?\n"))

  @doc """
  Ask for the character's level.
  """
  @spec ask_level() :: integer()
  def ask_level() do
    ask_for_characters("level")
    |> Integer.parse()
    |> elem(0)
  end

  @doc """
  Welcome the new player, ask for the character's name, class, and level.
  Print the map with the label "Your character".
  Return the character sheet as a map.
  """
  @spec run() :: map()
  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    mappy = %{name: name, class: class, level: level}
    IO.inspect(mappy, label: "Your character")
  end
end
