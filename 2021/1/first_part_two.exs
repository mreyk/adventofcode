defmodule FirstPartTwo do
  def execute do
    {:ok, output} = File.read("input.txt")
    {_strings, integers} = output
    |> String.split("\n")
    |> Enum.map_reduce([], fn value, new_output ->
      case is_binary(value) and String.length(value) > 0 do
	true ->
	  {value, new_output ++ [String.to_integer(value)]}
	false ->
	  {value, new_output}
      end
    end)
    integers_with_index = Enum.with_index(integers)
    {_elements, acc} = Enum.map_reduce(integers_with_index, 0, fn {_value, index} = element, acc ->
      if index > 2 do
	sum_a = Enum.at(integers, index - 3) + Enum.at(integers, index - 2) + Enum.at(integers, index - 1)
	sum_b = Enum.at(integers, index - 2) + Enum.at(integers, index - 1) + Enum.at(integers, index)
      	if sum_b > sum_a do
	  {element, acc + 1}
	else
	  {element, acc}
      	end
      else
	{element, acc}
      end
    end)
    acc
  end
end

output = FirstPartTwo.execute

IO.inspect output
