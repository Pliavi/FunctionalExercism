defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    proteins = 
      rna
      |> String.codepoints
      |> chunk_every(3)
      |> Enum.map(&Enum.join(&1))
      |> translate_rna
      |> Enum.uniq

    is_valid = Enum.reduce(proteins, true, fn(x, acc) -> 
      acc && x != "invalid"
    end)

    if is_valid do
      {:ok, proteins}
    else
      {:error, "invalid RNA"}
    end
  end

  # I could use chunk_every 3, but my Elixir is 1.4 T-T
  def chunk_every([],_), 
    do: []
  def chunk_every(list, count),
    do: [Enum.take(list, count)] ++ chunk_every(Enum.drop(list, count), count)

  def translate_rna([]), do: []
  def translate_rna([codon | codons]) do
    protein = of_codon codon

    case protein do
      {:ok, "STOP"}             -> []
      {:error, "invalid codon"} -> ["invalid"]
      _ -> [protein |> Tuple.to_list |> Enum.at(1)] ++ translate_rna(codons)
    end
  end

  @doc """
  Given a codon, return the corresponding protein
  UGU, UGC           -> Cysteine
  UUA, UUG           -> Leucine
  AUG                -> Methionine
  UUU, UUC           -> Phenylalanine
  UCU, UCC, UCA, UCG -> Serine
  UGG                -> Tryptophan
  UAU, UAC           -> Tyrosine
  UAA, UAG, UGA      -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    case codon do
      "UGU" -> {:ok, "Cysteine"}
      "UGC" -> {:ok, "Cysteine"}
      "UUA" -> {:ok, "Leucine"}
      "UUG" -> {:ok, "Leucine"}
      "AUG" -> {:ok, "Methionine"}
      "UUU" -> {:ok, "Phenylalanine"}
      "UUC" -> {:ok, "Phenylalanine"}
      "UCU" -> {:ok, "Serine"}
      "UCC" -> {:ok, "Serine"}
      "UCA" -> {:ok, "Serine"}
      "UCG" -> {:ok, "Serine"}
      "UGG" -> {:ok, "Tryptophan"}
      "UAU" -> {:ok, "Tyrosine"}
      "UAC" -> {:ok, "Tyrosine"}
      "UAA" -> {:ok, "STOP"}
      "UAG" -> {:ok, "STOP"}
      "UGA" -> {:ok, "STOP"}
      _     -> {:error, "invalid codon"}
    end
  end

end
