defmodule TwelveDays do
  @start_pattern "On the ${day} day of Christmas my true love gave to me, "

  @numbers [
    "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eighth",
    "ninth",
    "tenth",
    "eleventh",
    "twelfth"  
  ]

  @phrases [
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming" 
  ]

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    initial = @start_pattern
      |> String.replace("${day}", Enum.at(@numbers, number - 1))

    final = @phrases
      |> Enum.reverse
      |> Enum.drop(12 - number)

    final = final ++ [
      (if number > 1, do: "and ", else: "")
      <> "a Partridge in a Pear Tree."
    ]

    initial <> Enum.join(final, ", ")
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    starting_verse .. ending_verse
      |> Enum.map(&verse(&1))
      |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing():: String.t()
  def sing do
    verses 1, 12
  end
end

