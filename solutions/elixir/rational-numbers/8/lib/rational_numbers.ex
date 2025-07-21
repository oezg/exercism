defmodule RationalNumbers do
  @moduledoc false
  import Kernel, except: [apply: 2]

  @type rational :: {integer, integer}
  @unit {1, 1}
  @zero {0, 1}

  defguardp is_rational(a)
            when is_integer(elem(a, 0)) and is_integer(elem(a, 1)) and elem(a, 1) != 0

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({num_a, den_a} = a, {num_b, den_b} = b) when is_rational(a) and is_rational(b),
    do: reduce({num_a * den_b + den_a * num_b, den_a * den_b})

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, a) when is_rational(a), do: @zero
  def subtract(a, b) when is_rational(a) and is_rational(b), do: add(a, negate(b))

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({num_a, den_a} = a, {num_b, den_b} = b) when is_rational(a) and is_rational(b),
    do: reduce({num_a * num_b, den_a * den_b})

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(a :: rational, b :: rational) :: rational
  def divide_by(a, a) when is_rational(a), do: @unit
  def divide_by(a, b) when is_rational(a) and is_rational(b), do: multiply(a, invert(b))

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) when is_rational(a), do: do_abs(reduce(a))
  defp do_abs(a), do: if(compare(a, @zero) == :lt, do: negate(a), else: a)

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, exponent :: integer) :: rational
  def pow_rational(a, 0) when is_rational(a), do: @unit

  def pow_rational(a, exponent) when is_rational(a) and is_integer(exponent) and exponent < 0,
    do: pow_rational(invert(a), -exponent)

  def pow_rational(a, exponent) when is_rational(a) and is_integer(exponent) and exponent > 0,
    do: reduce(apply(a, &Integer.pow(&1, exponent)))

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(base :: integer, a :: rational) :: float
  def pow_real(base, a) when is_rational(a) and is_integer(base), do: :math.pow(base, to_float(a))

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({den, den}) when den != 0, do: @unit
  def reduce({0, den}) when den != 0, do: @zero
  def reduce({_num, den} = a) when den < 0, do: reduce(expand(a, -1))

  def reduce({num, den} = a) when den > 0 do
    case Integer.gcd(num, den) do
      1 -> a
      gcd -> apply(a, &div(&1, gcd))
    end
  end

  @spec apply(a :: rational, f :: (integer -> integer)) :: rational
  defp apply({num, den}, f), do: {f.(num), f.(den)}

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
  defp expand(a, scalar), do: apply(a, &Kernel.*(&1, scalar))

  @spec compare(a :: rational, b :: rational) :: :lt | :eq | :gt
  defp compare(a, a), do: :eq
  defp compare({num_a, den}, {num_b, den}) when num_a < num_b, do: :lt
  defp compare({num_a, den}, {num_b, den}) when num_a > num_b, do: :gt

  defp compare({_num_a, den_a} = a, {_num_b, den_b} = b) do
    case Integer.gcd(den_a, den_b) do
      1 -> compare(expand(a, den_b), expand(b, den_a))
      gcd -> compare(expand(a, div(den_b, gcd)), expand(b, div(den_a, gcd)))
    end
  end
end
