defmodule GuessingGame do
  @moduledoc """
  This is the GuessingGame module. A learning exercise about Guards, Multiple Clause Functions
  and Default Arguments.
  You are creating a trivial online game where a friend can guess a secret number. You want to
  give some feedback, but not give away the answer with a guess. You need to devise a function
  to provide different responses depending on how the guess relates to the secret number.

  Condition	                                                            Response
  When the guess matches the secret number	                            "Correct"
  When the guess is one more or one less than the secret number	        "So close"
  When the guess is greater than the secret number                      "Too high"
  When the guess is less than the secret number	                        "Too low"
  When a guess isn't made	                                              "Make a guess"

  All guesses and secret numbers are integer numbers.
  """

  @spec compare(integer(), integer() | :no_guess) :: String.t()
  def compare(secret_number, guess \\ :no_guess)
  def compare(_secret_number, guess)  when guess == :no_guess,              do: "Make a guess"
  def compare(secret_number, guess)   when secret_number == guess,          do: "Correct"
  def compare(secret_number, guess)   when abs(secret_number - guess) == 1, do: "So close"
  def compare(secret_number, guess)   when secret_number < guess,           do: "Too high"
  def compare(secret_number, guess)   when secret_number > guess,           do: "Too low"
end
