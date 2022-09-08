defmodule ThirdPartOne do
  def execute do
    {:ok, input} = File.read("input.txt")

    output = input
    |> String.split("\n", trim: true)
    |> Enum.map(& &1 |> String.graphemes() |> List.to_tuple())

    total = length(output)
    line = (Enum.at(output, 0) |> Tuple.to_list() |> length()) - 1

    gamma_list = for i <- 0..line do
      zeros = Enum.count(output, &(elem(&1, i) == "0"))
      ones = total - zeros
      if zeros > ones do
	"0"
      else
	"1"
      end
    end
    
    epsilon_list = gamma_list |> Enum.map(fn x ->
      if x == "0" do
	"1"
      else "0"
      end
    end)

    epsilon =
      epsilon_list
      |> Enum.join("")
      |> Integer.parse(2)
      |> elem(0)

    gamma =
      gamma_list
      |> Enum.join("")
      |> Integer.parse(2)
      |> elem(0)

    gamma * epsilon
  end
end

output = ThirdPartOne.execute

IO.inspect output
