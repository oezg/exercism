defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(rational, rational) :: rational
  def add({a, b}, {c, d}), do: reduce({a * d + b * c, b * d})

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(num :: rational, rational) :: rational
  def subtract(num, {c, d}), do: add(num, {-c, d})

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(rational, rational) :: rational
  def multiply({a, b}, {c, d}), do: reduce({a * c, b * d})

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, rational) :: rational
  def divide_by(num, {c, d}), do: multiply(num, {d, c})

  @doc """
  Absolute value of a rational number
  """
  @spec abs(rational) :: rational
  def abs({a, b}), do: reduce({Kernel.abs(a), Kernel.abs(b)})

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(rational, n :: integer) :: rational
  def pow_rational({a, b}, n) when n < 0, do: pow_rational({b, a}, -n)
  def pow_rational({a, b}, n), do: reduce({a ** n, b ** n})

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, rational) :: float
  def pow_real(x, {a, b}), do: :math.pow(x, a / b)

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(rational) :: rational
  def reduce({a, b}) when b < 0, do: reduce({-a, -b})

  def reduce({a, b}) do
    gcd = Integer.gcd(a, b)
    {div(a, gcd), div(b, gcd)}
  end
end
