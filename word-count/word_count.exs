defmodule Words do

  @puncuation_getter ~r/[\s_!@#$%^&*(),:;]/

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(@puncuation_getter, trim: true)
    |> Enum.group_by(fn word -> word end)
    |> Enum.map(fn {k,v} -> {k, length(v)} end)
    |> Map.new
  end

end
