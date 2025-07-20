defmodule BirdCount do
  @moduledoc false

  defdelegate today(list), to: List, as: :first

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _tail]), do: true
  def has_day_without_birds?([_head | tail]), do: has_day_without_birds?(tail)

  def total([]), do: 0
  def total([head | tail]), do: head + total(tail)

  def busy_days([]), do: 0
  def busy_days([head | tail]) when head in 0..4, do: busy_days(tail)
  def busy_days([_head | tail]), do: 1 + busy_days(tail)
end
