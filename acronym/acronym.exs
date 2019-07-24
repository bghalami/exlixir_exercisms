defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.split(~r/[\s-]/, string)
    |> Enum.map(fn word -> custom_cap(word, multiple_caps?(word)) end)
    # |> Enum.join()
    # |> String.split("")
    # |> Enum.filter(fn letter -> Regex.match?(~r/[A-Z]/, letter) end)
    # |> Enum.join()
  end

  defp custom_cap(word, true), do: word
  defp custom_cap(word, _), do: String.capitalize(word)

  defp multiple_caps?(word), do: String.match?(word, ~r/[A-Z{2,}]/)
end
