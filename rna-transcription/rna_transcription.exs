defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """

  @spec to_rna([char]) :: [char]
  def to_rna(dna) when length(dna) == 1 do
    map = %{
      'G' => 'C',
      'C' => 'G',
      'T' => 'A',
      'A' => 'U'
    }
    map[dna]
  end

  def to_rna(dna) do
    map = %{
      "G" => 67,
      "C" => 71,
      "T" => 65,
      "A" => 85
    }
    dna
    |> Enum.map(fn el -> map[<<el>>] end)
  end
end
