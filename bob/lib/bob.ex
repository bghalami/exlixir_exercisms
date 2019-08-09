defmodule Bob do
  def hey(input) do
    cond do
      yell_question(input) ->
        "Calm down, I know what I'm doing!"
      ask_question(input) ->
        "Sure."
      silent_treatment(input) ->
        "Fine. Be that way!"
      yelling(input) ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end

  @spec yell_question(String.t()) :: boolean
  def yell_question(input) do
    String.last(input) == "?" && String.upcase(input) == input && String.match?(input, ~r/[A-Z]/)
  end
  @spec ask_question(String.t()) :: boolean
  def ask_question(input) do
    String.last(input) == "?"
  end
  @spec silent_treatment(String.t()) :: boolean
  def silent_treatment(input) do
    String.trim(input) == ""
  end
  @spec yelling(String.t()) :: boolean
  def yelling(input) do
    String.upcase(input) == input && String.match?(input, ~r/\p{L}/u)
  end
end
