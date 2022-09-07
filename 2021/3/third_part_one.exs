defmodule ThirdPartOne do
  def execute do
    input = "00100\n11110\n10110\n10111\n10101\n01111\n00111\n11100\n10000\n11001\n00010\n01010"

    # {:ok, output} = File.read("input.txt")
    # {_items, %{h: horizontal, d: depth}} = output
    # |> String.split("\n", trim: true)

    output = input
    |> String.split("\n", trim: true)

    length = String.length(Enum.at(output, 0))
    Enum.map(1..length, fn column ->
      Enum.reduce(output, fn item ->
	digit = String.to_integer(Enum.at(item, column))
	
	
      end)
    end)
    
    gamma_rate = "the most common value"
    epsilon_rate = "the least common value"
    power_consumption = gamma_rate * epsilon_rate
    
  end
end

output = ThirdPartOne.execute

IO.inspect output
