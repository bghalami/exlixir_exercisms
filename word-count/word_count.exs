defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.replace(puncuation_getter(), " ")
    |> String.split()
    |> Enum.group_by(fn word -> word end)
    |> Enum.map(fn {k,v} -> {k, length(v)} end)
    |> Map.new
  end

  def puncuation_getter do
    ~r/[_!@#$%^&*(),:;]/
  end
end
