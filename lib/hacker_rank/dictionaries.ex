defmodule Dictionaries do
  @moduledoc """
  HackerRank Question
  """

  def do_dictionaries(map1) do
    Enum.each(IO.stream(:stdio, :line),
      fn x ->
        x = String.trim(x) |> String.to_atom
        case Map.get(map1, x) do
          :nil -> IO.puts("Not found")
          v -> IO.puts("#{x}=#{v}")
        end
      end
    )
  end

  def exec() do
    i = IO.gets("")
      |> String.trim
      |> String.to_integer
    map1 = Enum.reduce(1..i, %{}, fn _i, acc ->
      IO.gets("")
        |> String.trim
        |> String.split
        |> Enum.chunk_every(2)
        |> Map.new(fn [k, v] -> {String.to_atom(k), v} end)
        |> Map.merge(acc)
    end)
    do_dictionaries(map1)
  end
end