defmodule FirstPartTwoOptimal do
  def execute do
    {:ok, output} = File.read("input.txt")
    output
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [left, right] -> Enum.sum(right) > Enum.sum(left) end)
  end
end

output = FirstPartTwoOptimal.execute

IO.inspect output
