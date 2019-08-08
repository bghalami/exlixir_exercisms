defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    num_loop(number, "")
  end

  @spec num_loop(pos_integer, String.t()) :: String.t()
  def num_loop(num, string) when num >= 1000, do: num_loop(num - 1000, string <> "M")
  def num_loop(num, string) when num >= 900, do: num_loop(num - 900, string <> "CM" )
  def num_loop(num, string) when num >= 500, do: num_loop(num - 500, string <> "D" )
  def num_loop(num, string) when num >= 400, do: num_loop(num - 400, string <> "CD" )
  def num_loop(num, string) when num >= 100, do: num_loop(num - 100, string <> "C" )
  def num_loop(num, string) when num >= 90, do: num_loop(num - 90, string <> "XC")
  def num_loop(num, string) when num >= 50, do: num_loop(num - 50, string <> "L")
  def num_loop(num, string) when num >= 40, do: num_loop(num - 40, string <> "XL")
  def num_loop(num, string) when num >= 10, do: num_loop(num - 10, string <> "X")
  def num_loop(num, string) when num >= 9, do: num_loop(num - 9, string <> "IX")
  def num_loop(num, string) when num >= 5, do: num_loop(num - 5, string <> "V")
  def num_loop(num, string) when num >= 4, do: num_loop(num - 4, string <> "IV")
  def num_loop(num, string) when num >= 1, do: num_loop(num - 1, string <> "I")
  def num_loop(_, string), do: string
end
