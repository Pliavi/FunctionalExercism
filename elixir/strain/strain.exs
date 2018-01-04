defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  # Strain.keep [1,2,3], fn(x) -> rem(x, 2) == 0 end    
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep([], _), do: []

  def keep([head | list], fun) do
    if fun.(head) do
      [head] ++ keep list, fun
    else
      keep list, fun
    end
  end


  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  # Strain.discard [1,2,3], fn(x) -> rem(x, 2) == 0 end    
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    keep list, &not(fun.(&1))
  end
end


