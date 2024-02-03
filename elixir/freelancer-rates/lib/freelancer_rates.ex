defmodule FreelancerRates do
  @moduledoc """
  This is Freelancer Rates module. A learning exercise for numbers
  This module helps a freelancer communicate with a project
  manager by providing a few utilities to quickly calculate
  daily and monthly rates, optionally with a given discount.

  The daily rate is 8 times the hourly rate.
  A month has 22 billable days.

  Discounts are modeled as fractional numbers representing
  percentage, for example 25.0 (25%).
  """

  @doc """
  Given a hourly rate, return the daily rate

  ## Examples

    iex>FreelancerRates.daily_rate(60)
    480.0
  """
  @spec daily_rate(number()) :: float()
  def daily_rate(hourly_rate), do: 8.0 * hourly_rate

  @doc """
  Given the price before the discoudn and a discount,
  return price after the discount.

  ## Examples

    iex>FreelancerRates.apply_discount(150, 10)
    135.0
  """
  @spec apply_discount(number(), number()) :: float()
  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  @doc """
  Given the hourly rate and a discount, apply the discount and
  return the monthly rate rounded up to the nearest integer.

  ## Examples

    iex>FreelancerRates.monthly_rate(77, 10.5)
    12130
  """
  @spec monthly_rate(number(), number()) :: integer()
  def monthly_rate(hourly_rate, discount) do
    monthly_rate_before_discount = daily_rate(hourly_rate) * 22
    monthly_rate_after_discount = apply_discount(monthly_rate_before_discount, discount)
    trunc(Float.ceil(monthly_rate_after_discount))
  end

  @doc """
  Given a budget, the hourly rate and a discount, apply the
  discount and return how many days of work that covers.

  The returned number of days should be rounded
  down to one decimal place.

  ## Examples

    iex>FreelancerRates.days_in_budget(20000, 80, 11.0)
    35.1
  """
  @spec days_in_budget(number(), number(), number()) :: float()
  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate_after_discount = apply_discount(daily_rate(hourly_rate), discount)
    Float.floor(budget / daily_rate_after_discount, 1)
  end
end
