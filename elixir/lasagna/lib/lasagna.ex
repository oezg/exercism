defmodule Lasagna do
  @spec expected_minutes_in_oven() :: number()
  def expected_minutes_in_oven do
    40
  end

  @spec remaining_minutes_in_oven(number()) :: number()
  def remaining_minutes_in_oven(minutes_in_oven) do
    expected_minutes_in_oven() - minutes_in_oven
  end

  @spec preparation_time_in_minutes(number()) :: number()
  def preparation_time_in_minutes(layers) do
    2 * layers
  end

  @spec total_time_in_minutes(number(), number()) :: number()
  def total_time_in_minutes(layers, minutes_in_oven) do
    preparation_time_in_minutes(layers) + minutes_in_oven
  end

  @spec alarm() :: String.t()
  def alarm do
    "Ding!"
  end
end
