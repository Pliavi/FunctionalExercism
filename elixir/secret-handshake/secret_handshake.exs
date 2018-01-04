defmodule SecretHandshake do
  @action %{ 1 => "wink", 2 => "double blink", 3 => "close your eyes", 4 => "jump" , 5 => :reverse }
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 => wink
  10 => double blink
  100 => close your eyes
  1000 => jump
  10000 => Reverse the order of the operations in the secret handshake
  """
  # it`s not good, i'll improve after xD
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    actions = 
      Integer.digits(code, 2) 
      |> Enum.reverse
      |> decode(1)

    if (List.last actions) == :reverse do
      actions 
        |> List.delete_at(-1)
        |> Enum.reverse
    else
      actions
    end

  end

  def decode([digit | digits], counter) do 
    if digit == 1 do
      [@action[counter]] ++ (decode(digits, counter + 1))
    else
      decode(digits, counter + 1)
    end
  end

  def decode([], counter) do
    []
  end
end
