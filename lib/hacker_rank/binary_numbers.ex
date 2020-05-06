defmodule BinaryNumbers do
  @moduledoc """
  HackerRank Question
  """

  def exec() do
    i = IO.gets("") |> String.trim |> String.to_integer
    Integer.digits(i, 2) |> Enum.chunk_by(fn(x) -> x==0 end) |> Enum.map(&Enum.count/1) |> Enum.max |> IO.puts
  end
end
