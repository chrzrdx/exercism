defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]
  # @histogram @nucleotides |> Stream.map(&{&1, 0}) |> Map.new()

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    strand
    |> Enum.count(&(&1 == nucleotide))
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    @nucleotides
    |> Map.new(&{&1, count(strand, &1)})

    # %{
    #   ?A => count(strand, ?A),
    #   ?T => count(strand, ?T),
    #   ?G => count(strand, ?G),
    #   ?C => count(strand, ?C)
    # }
  end
end
