defmodule Secrets do
  @moduledoc """
  This is the Secrets module. A learning exercise for anonymous functions.
  A software for an encryption device that works by performing transformations on data.

  Each function expects integer arguments and returns an anonymous function.
  """

  @doc """
  Given a secret integer, return a function which takes one argument and
  adds to it the argument passed in to secret_add.

  ## Examples
    iex>adder = Secrets.secret_add(2)
    iex>adder.(2)
    4
  """
  @spec secret_add(integer()) :: (number() -> number())
  def secret_add(secret) do
    &(&1 + secret)
  end

  @doc """
  Given a secret integer, return a function which takes one argument and
  subtracts the secret passed in to secret_subtract from that argument.

  ## Examples
    iex>subtractor = Secrets.secret_subtract(2)
    iex>subtractor.(3)
    1
  """
  @spec secret_subtract(integer()) :: (integer() -> integer())
  def secret_subtract(secret) do
    fn param -> param - secret end
  end

  @spec secret_multiply(integer()) :: (integer() -> integer())
  def secret_multiply(secret) do
    fn param -> param * secret end
  end

  @spec secret_divide(integer()) :: (integer() -> integer())
  def secret_divide(secret) do
    fn param -> div(param, secret) end
  end

  @doc """
  Return a function which takes one argument and performs a bitwise
  and operation on it and the secret passed in to secret_and.

    iex>ander = Secrets.secret_and(1)
    iex>ander.(2)
    0
  """
  @spec secret_and(integer()) :: (integer() -> integer())
  def secret_and(secret) do
    fn param -> Bitwise.band(param, secret) end
  end

  @spec secret_xor(integer()) :: (integer() -> integer())
  def secret_xor(secret) do
    fn param -> Bitwise.bxor(param, secret) end
  end

  @doc """
  Return a function which takes one argument and applies to it
  the two functions passed in to secret_combine in order.

    iex>multiply = Secrets.secret_multiply(7)
    iex>divide = Secrets.secret_divide(3)
    iex>combined = Secrets.secret_combine(multiply, divide)

    iex>combined.(6)
    14
  """
  @spec secret_combine((integer() -> integer()), (integer() -> integer())) :: (integer() -> integer())
  def secret_combine(secret_function1, secret_function2) do
    fn param -> secret_function2.(secret_function1.(param)) end
  end
end
