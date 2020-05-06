defmodule LetsReview do
  @moduledoc """
  HackerRank Question
  """
  def do_lets_review(s) do
    IO.puts("#{s |> String.codepoints |> Enum.take_every(2) |> Enum.join("")} #{s |> String.codepoints |> Enum.drop_every(2) |> Enum.join("")}")
  end

  def exec() do
    i = IO.gets("") |> String.trim |> String.to_integer
    l = for _ <- 1..i, do: IO.gets("") |> String.trim
    l |> Enum.map(&(do_lets_review(&1)))
  end
end
