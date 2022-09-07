defmodule FirstPartOne do
  def execute do
    {:ok, output} = File.read("input.txt")
    enumerable = String.split(output, "")
    up = Enum.count(enumerable, fn element ->
      element == "("
    end)
    down = Enum.count(enumerable, fn element ->
      element == ")"
    end)
    up - down
  end
end

output = FirstPartOne.execute

IO.inspect output
