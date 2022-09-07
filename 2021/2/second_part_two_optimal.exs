defmodule Submarine do

  def navigate() do

  end
end


defmodule SecondPartTwo do
  def execute do
    {:ok, output} = File.read("input.txt")
    output
    |> String.split("\n", trim: true)
    |> Enum.reduce({_depth = 0, _position = 0, _aim = 0}, &Submarine.navigate/2)
    |> then(fn {depth, position, _aim} -> depth * position end)
  end

  # def execute do
  #   {:ok, output} = File.read("input.txt")
  #   output
  #   |> String.split("\n", trim: true)
  #   |> Enum.reduce({_depth = 0, _position = 0, _aim = 0}, fn
  #     "forward" <> number, {depth, position, aim} ->
  # 	number = String.to_integer(number)
  #     {depth + aim * number, number + position, aim}
  #     "down" <> number, {depth, position, aim} ->
  # 	{depth, position, aim + String.to_integer(number)}
  #     "up" <> number, {depth, position, aim} ->
  # 	{depth, position, aim - String.to_integer(number)}
  #   end)
  #   |> then(fn {depth, position, _aim} -> depth * position end)
  # end

  

end

output = SecondPartTwo.execute

IO.inspect output

