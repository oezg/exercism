defmodule LogLevel do
  @moduledoc """
  This is the LogLevel module. A learning exercise for Atoms and Cond.
  You are running a system that consists of a few applications producing many logs.
  You want to write a small program that will aggregate those logs and give them
  labels according to their severity level. All applications in your system use
  the same log codes, but some of the legacy applications don't support all the codes.

  Log code	Log label	Supported in legacy apps?
  0	        trace	    no
  1	        debug	    yes
  2	        info	    yes
  3	        warning	  yes
  4	        error	    yes
  5	        fatal	    no
  other   	unknown	  -
  """

  @doc """
  Given an integer code and a boolean flag telling you if the log comes from
  a legacy app, return the label of a log line as an atom.

  Log codes not specified in the table should return an unknown label.
  Log codes specified in the table as not supported in legacy apps should also
  return an unknown label if the log came from a legacy app.

  ## Examples

    iex>LogLevel.to_label(0, false)
    :trace

    iex>LogLevel.to_label(0, true)
    :unknown
  """
  @spec to_label(integer(), boolean()) :: :debug | :error | :fatal | :info | :trace | :unknown | :warning
  def to_label(level, legacy?) do
    cond do
        level == 0 and not legacy? -> :trace
        level == 1 -> :debug
        level == 2 -> :info
        level == 3 -> :warning
        level == 4 -> :error
        level == 5 and not legacy? -> :fatal
        true -> :unknown
    end
  end

  @doc """
  Given an integer code and a boolean flag telling you if the log comes from
  a legacy app, return the name of the recipient as an atom.

  If the log label is error or fatal, send the alert to the ops team.
  If you receive a log with an unknown label from a legacy system, send
  the alert to the dev1 team, other unknown labels should be sent to the dev2
  team. All other log labels can be safely ignored by returning false.

  ## Examples

    iex>LogLevel.alert_recipient(-1, true)
    :dev1

    iex>LogLevel.alert_recipient(0, false)
    false
  """
  @spec alert_recipient(integer(), boolean()) :: :dev1 | :dev2 | false | :ops
  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    cond do
        label in [:error, :fatal] -> :ops
        label == :unknown -> cond do
          legacy? -> :dev1
          true    -> :dev2
        end
        true -> false
    end
  end
end
