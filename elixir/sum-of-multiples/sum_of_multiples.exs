defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    (for n <- 1..limit-1, 
    multipleAny?(n, factors), do: n)
    |> Enum.sum
  end

  @spec multipleAny?(non_neg_integer, [non_neg_integer]) :: boolean
  def multipleAny?(number, factors) do 
    Enum.reduce(factors, false, 
      fn(factor, acc) -> 
        acc || multiple?(number, factor)
      end)
  end

  @spec multiple?(non_neg_integer, non_neg_integer) :: boolean
  def multiple?(number, factor), do: (rem number, factor) == 0
end
