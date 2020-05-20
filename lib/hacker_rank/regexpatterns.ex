defmodule Regexpatterns do
  def matcher([_, email]) do
    Regex.match?(~r/@gmail.com$/, email)
  end

  def exec do
    n = IO.gets("") |> String.trim |> String.to_integer
    list = for _ <- 1..n, do: IO.gets("") |> String.trim |> String.split
    list
      |> Enum.filter(&matcher/1)
      |> Enum.map(fn [n, _] -> n end)
      |> Enum.sort
      |> Enum.map(&IO.puts/1)
  end
end