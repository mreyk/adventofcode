defmodule FirstPartTwo do
  def execute do
    {:ok, output} = File.read("input.txt")
    enumerable = String.split(output, "")
    %{floor: -1, index: index} = Enum.reduce_while(enumerable, %{floor: 0, index: 0}, fn element, acc ->
      previous_index = Map.get(acc, :index)
      current_floor = Map.get(acc, :floor)
      new_index = previous_index + 1
      case element do
	"(" ->
	  new_floor = current_floor + 1
	  if (new_floor == -1) do
	    {:halt, %{floor: new_floor, index: new_index}}
	  else
	    {:cont, %{floor: new_floor, index: new_index}}
	  end
	")" ->
	  new_floor = current_floor - 1
	  if (new_floor == -1) do
	    {:halt, %{floor: new_floor, index: new_index}}
	  else
	    {:cont, %{floor: new_floor, index: new_index}}
	  end
	_ ->
	  {:cont, %{floor: current_floor, index: previous_index}}
      end
    end)
    index
  end
end

output = FirstPartTwo.execute

IO.inspect output
