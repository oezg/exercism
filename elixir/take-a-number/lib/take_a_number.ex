defmodule TakeANumber do
  defp loop(state \\ 0) do
    receive do
      :stop ->
        nil

      {:take_a_number, sender_pid} ->
        send(self(), {:report_state, sender_pid})
        loop(state + 1)

      {:report_state, sender_pid} ->
        send(sender_pid, state)
        loop(state)

      _ ->
        loop(state)
    end
  end

  def start() do
    spawn(&loop/0)
  end
end
