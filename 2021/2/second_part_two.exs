defmodule SecondPartTwo do
  def execute do
    {:ok, output} = File.read("input.txt")
    {_items, %{h: horizontal, d: depth, a: _aim}} = output
    |> String.split("\n", trim: true)
    |> Enum.map_reduce(%{h: 0, d: 0, a: 0}, fn line, acc ->
      [word, number] = String.split(line, " ", trim: true)
      horizontal = Map.get(acc, :h)
      depth = Map.get(acc, :d)
      aim = Map.get(acc, :a)
      number = String.to_integer(number)
      case word do
	"forward" ->
	  {line, %{h: horizontal + number, d: depth + (aim * number), a: aim}}
	"down" ->
	  {line, %{h: horizontal, d: depth, a: aim + number}}
	"up" ->
	  {line, %{h: horizontal, d: depth, a: aim - number}}
	_ ->
	  {line, acc}
      end
    end)
    horizontal * depth
  end
end

output = SecondPartTwo.execute

IO.inspect output
