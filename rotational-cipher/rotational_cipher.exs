defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_char_list()
    |> Enum.map(fn el ->
                  String.match?(<<el>>, ~r/\A[a-zA-Z]\z/)
                  |> rotate_helper(el, shift)
                end)
    |> List.to_string()
  end

  @spec rotate_helper(match :: boolean, codepoint :: integer, shift :: integer) :: integer
  defp rotate_helper(match, codepoint, _shift) when match != true, do: codepoint

  defp rotate_helper(_match, codepoint, shift)
    when codepoint < 97 and codepoint + shift > 90
    or   codepoint + shift > 122,
    do: codepoint + shift - 26

  defp rotate_helper(_match, codepoint, shift), do: codepoint + shift
end
