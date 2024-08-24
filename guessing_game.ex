defmodule GuessingGame do
  # guess between a low and a high -> guess the middle number
  # tell user our guess
  # ÿes -> game over
  # "bigger"-> bigger (low,high)
  #  smaller -> smaller (low, high)
  # anything else -> valid response

  def guess(a,b) when a>b do
    guess(b,a)
  end
  
  def guess(low, high) do
    answer = IO.gets("Hmm. May be you're thinking of #{mid(low, high)}?\n")

    case String.trim(to_string(answer)) do
      "bigger" ->
        bigger(low, high)

      "smaller" ->
        smaller(low, high)

      "yes" ->
        "I knew I could guess your number"

      _ ->
        IO.puts(~s{ Type "bigger","smaller", "yes"})
        guess(low, high)
    end
  end

  def mid(low, high) do
    div(low + high, 2)
  end

  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end
end
