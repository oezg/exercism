defmodule FreelancerRates do
  @day_hours 8.0
  @month_days 22

  @spec daily_rate(number()) :: float()
  def daily_rate(hourly_rate) do
    @day_hours * hourly_rate
  end

  @spec apply_discount(number(), number()) :: float()
  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  @spec monthly_rate(number(), number()) :: integer()
  def monthly_rate(hourly_rate, discount) do
    ceil(apply_discount(daily_rate(hourly_rate) * @month_days, discount))
  end

  @spec days_in_budget(number(), number(), number()) :: float()
  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget / apply_discount(daily_rate(hourly_rate), discount), 1)
  end
end
