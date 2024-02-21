defmodule TakeANumber do
  @moduledoc """
  Learning exercise for PID's and Processes
  """

  @spec loop(integer()) :: nil
  defp loop(state \\ 0) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        loop(state)

      {:take_a_number, sender_pid} ->
        state = state + 1
        send(sender_pid, state)
        loop(state)

      :stop -> nil

      _ -> loop(state)
    end
  end

  @spec start() :: pid()
  def start() do
    spawn(&loop/0)
  end
end
