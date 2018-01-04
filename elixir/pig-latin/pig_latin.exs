defmodule PigLatin do
  @doc """ Tradutor de PigLatin """
  @vowels ["a","e","i","o","u"]
  @vowels_2 ["yt","xr"]

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase 
    |> String.split
    |> Enum.map(&translate_word(&1, ""))
    |> Enum.join(" ")
  end


  def translate_word(word, result) do
    {action, drop_up} =
    cond do
      String.starts_with? word, "qu"      -> {:continue, 2}
      String.starts_with? word, @vowels_2 -> {:stop, 0}
      String.starts_with? word, @vowels   -> {:stop, 0}
      true                                -> {:continue, 1}
    end

    if action == :continue do
      {split, word} =  String.split_at word, drop_up 
      result = result <> split

      translate_word(word, result)
    else
      word <> result <> "ay"
    end
  end
end
