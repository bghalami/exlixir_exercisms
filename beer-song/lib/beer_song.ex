defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number), do: "#{line_one(number)}\n#{line_two(number)}\n"

  @spec line_one(integer) :: String.t()
  defp line_one(1), do: "1 bottle of beer on the wall, 1 bottle of beer."
  defp line_one(0), do: "No more bottles of beer on the wall, no more bottles of beer."
  defp line_one(number), do: "#{number} bottles of beer on the wall, #{number} bottles of beer."

  @spec line_two(integer) :: String.t()
  defp line_two(2), do: "Take one down and pass it around, 1 bottle of beer on the wall."
  defp line_two(1), do: "Take it down and pass it around, no more bottles of beer on the wall."
  defp line_two(0), do: "Go to the store and buy some more, 99 bottles of beer on the wall."
  defp line_two(number), do: "Take one down and pass it around, #{number - 1} bottles of beer on the wall."

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    range
    |> Enum.reduce("", fn bottles, acc ->
                          case bottles do
                            0 ->
                              acc <> verse(bottles)
                            _ ->
                              acc <> verse(bottles) <> "\n"
                          end
                       end)
  end
end
