defmodule Sublist do
  
  def compare([], []), do: :equal
  def compare(a, b) do
    cond do
      a == b                -> :equal
      length(a) < length(b) -> do_compare(a, b, false)
      true                  -> do_compare(b, a, true)
    end
  end

  def do_compare(_, [],_), do: :unequal
  def do_compare(small, big, reverse) do
    partial = Enum.take big, length small
    
    if small === partial do 
      if reverse, 
        do: :superlist, 
        else: :sublist
    else
      do_compare small, (tl big), reverse
    end
  end

end
