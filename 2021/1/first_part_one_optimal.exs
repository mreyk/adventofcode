defmodule FirstPartOneOptimal do
  def execute do
    {:ok, output} = File.read("input.txt")
    output
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [left, right] -> right > left end)
  end
end

output = FirstPartOneOptimal.execute

IO.inspect output
