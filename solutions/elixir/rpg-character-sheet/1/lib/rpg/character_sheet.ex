defmodule RPG.CharacterSheet do
  @spec welcome() :: :ok
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  @spec ask_name() :: binary()
  def ask_name() do
    ask("name")
  end

  @spec ask_class() :: binary()
  def ask_class() do
    ask("class")
  end

  @spec ask_level() :: integer()
  def ask_level() do
    ask("level") |> String.to_integer()
  end

  @spec run() :: any()
  def run() do
    IO.puts("Welcome! Let's fill out your character sheet together.")

    %{name: ask_name(), class: ask_class(), level: ask_level()}
    |> IO.inspect(label: "Your character")
  end

  defp ask(prompt) do
    IO.gets("What is your character's #{prompt}?\n")
    |> String.trim()
  end
end
