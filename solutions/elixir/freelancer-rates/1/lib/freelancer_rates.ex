defmodule FreelancerRates do
  @day_hours 8.0
  @month_days 22

  def daily_rate(hourly_rate) do
    @day_hours * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    ceil(apply_discount(daily_rate(hourly_rate) * @month_days, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    trunc(budget / apply_discount(daily_rate(hourly_rate), discount) * 10) / 10
  end
end
