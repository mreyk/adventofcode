defmodule SecondPartOne do
  def execute do
    {:ok, output} = File.read("input.txt")
    output
    |> String.split("\n", trim: true)
    |> Enum.reduce({_depth = 0, _position = 0}, fn
      "forward " <> number, {depth, position} ->
	{depth, String.to_integer(number) + position}
      "down " <> number, {depth, position} ->
	{depth + String.to_integer(number), position}
      "up " <> number, {depth, position} ->
	{depth - String.to_integer(number), position}
    end)
    |> then(fn {depth, position} -> depth * position end)
  end

  def execute_another do
    {:ok, output} = File.read("input.txt")
    output
    |> String.split("\n", trim: true)
    |> Enum.map(fn
      "forward " <> number -> {0, String.to_integer(number)}
      "down " <> number -> {String.to_integer(number), 0}
      "up " <> number -> {-String.to_integer(number), 0}
    end)
    |> Enum.reduce({_depth = 0, _position = 0}, fn
      {depth_change, position_change}, {depth, position} ->
	{depth + depth_change, position + position_change}
    end)
    |> then(fn {depth, position} -> depth * position end)
  end

  def execute_old do
    {:ok, output} = File.read("input.txt")
    output
    |> String.split("\n", trim: true)
    |> Enum.map(fn
      "forward " <> number -> {:forward, String.to_integer(number)}
      "down " <> number -> {:down, String.to_integer(number)}
      "up " <> number -> {:up, String.to_integer(number)}
    end)
    |> Enum.reduce({_depth = 0, _position = 0}, fn
      {:forward, value}, {depth, position} -> {depth, position + value}
      {:down, value}, {depth, position} -> {depth + value, position}
      {:up, value}, {depth, position} -> {depth - value, position}
    end)
    |> then(fn {depth, position} -> depth * position end)
  end
end

output = SecondPartOne.execute

IO.inspect output
