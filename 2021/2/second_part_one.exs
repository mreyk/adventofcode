defmodule SecondPartOne do
  def execute do
    {:ok, output} = File.read("input.txt")
    {_items, %{h: horizontal, d: depth}} = output
    |> String.split("\n", trim: true)
    |> Enum.map_reduce(%{h: 0, d: 0}, fn line, acc ->
      [word, number] = String.split(line, " ", trim: true)
      case word do
	"forward" ->
	  {line, %{h: Map.get(acc, :h) + String.to_integer(number), d: Map.get(acc, :d)}}
	"down" ->
	  {line, %{h: Map.get(acc, :h), d: Map.get(acc, :d) + String.to_integer(number)}}
	"up" ->
	  {line, %{h: Map.get(acc, :h), d: Map.get(acc, :d) - String.to_integer(number)}}
	_ ->
	  {line, acc}
      end
    end)
    horizontal * depth
  end
end

output = SecondPartOne.execute

IO.inspect output
