defmodule TakeANumber do
  @moduledoc """
  Learning exercise for PID's and Processes
  """

  @spec loop(integer()) :: nil
  defp loop(last_number \\ 0) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, last_number)
        loop(last_number)

      {:take_a_number, sender_pid} ->
        last_number = last_number + 1
        send(sender_pid, last_number)
        loop(last_number)

      :stop -> nil

      _ -> loop(last_number)
    end
  end

  @spec start() :: pid()
  def start() do
    spawn(&loop/0)
  end
end
