defmodule RationalNumbers do
  @moduledoc false
  @type rational :: {integer, integer}
  @unit {1, 1}
  @zero {0, 1}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({num_a, den_a}, {num_b, den_b}),
    do: reduce({num_a * den_b + den_a * num_b, den_a * den_b})

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b), do: add(a, negate(b))

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({num_a, den_a}, {num_b, den_b}),
    do: reduce({num_a * num_b, den_a * den_b})

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(a :: rational, b :: rational) :: rational
  def divide_by(a, b), do: multiply(a, invert(b))

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a), do: reduce(transform(a, &Kernel.abs/1))

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, exponent :: integer) :: rational
  def pow_rational(a, exponent) when exponent < 0, do: pow_rational(invert(a), -exponent)
  def pow_rational(a, exponent), do: reduce(transform(a, &Integer.pow(&1, exponent)))

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(base :: integer, a :: rational) :: float
  def pow_real(base, a), do: :math.pow(base, to_float(a))

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({n, n}) when n != 0, do: @unit
  def reduce({0, den}) when den != 0, do: @zero
  def reduce({_num, den} = a) when den < 0, do: reduce(expand(a, -1))

  def reduce({num, den} = a) when den > 0 do
    case Integer.gcd(num, den) do
      1 -> a
      gcd -> transform(a, &div(&1, gcd))
    end
  end

  @spec transform(a :: rational, f :: function) :: rational
  defp transform({num, den}, f), do: {f.(num), f.(den)}

  @spec negate(a :: rational) :: rational
  defp negate(a), do: scale(a, -1)

  @spec scale(a :: rational, scalar :: integer) :: rational
  defp scale(a, scalar), do: multiply(a, to_rational(scalar))

  @spec to_rational(scalar :: integer) :: rational
  defp to_rational(scalar), do: {scalar, 1}

  @spec to_float(a :: rational) :: float
  defp to_float({num, den}) when den > 0, do: num / den

  @spec invert(a :: rational) :: rational
  defp invert({num, den}) when num > 0, do: {den, num}
  defp invert({num, _den} = a) when num < 0, do: expand(a, -1) |> invert()

  @spec expand(a :: rational, scalar :: integer) :: rational
  defp expand(a, scalar), do: transform(a, &Kernel.*(&1, scalar))
end
