defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    # Isso que eu chamo de codigo limpo :v
    if length(a) >= length(b) do
      (what_is = do_compare(a, b, 0)) == :sub_or_superlist 
        && :superlist 
        || what_is
    else
      (what_is = do_compare(b, a, 0)) == :sub_or_superlist 
        && :sublist   
        || what_is
    end
  end

  defp do_compare([],[], _), do: :equal
  defp do_compare([x | a], b, i) do
    if length(b) == i && i > 0 do
      :sub_or_superlist
    else
      x == Enum.at(b, i) 
      && do_compare(a, b, i + 1)
      || do_compare(a, b, 0)
    end
  end
  defp do_compare(a, b, _) when length(a) < length(b), do: :unequal
end
