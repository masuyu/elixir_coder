defmodule RunningTimeAndComplexity do
  def make_list(number, result) when number == 2, do: result
  def make_list(number, result), do: make_list(number-1, [number|result])

  def sieve([head|_], number) when rem(number, head) == 0, do: false
  def sieve([_|tail], number), do: sieve(tail, number)
  def sieve([], _), do: true

  def is_prime(number) when number == 1, do: false
  def is_prime(number) when number == 2, do: true
  def is_prime(number) when number == 3, do: true
  def is_prime(number) when rem(number, 2) == 0, do: false
  def is_prime(number), do: make_list(trunc(:math.sqrt(number)), []) |> sieve(number)

  def output(result) when result == true, do: IO.puts("Prime")
  def output(_), do: IO.puts("Not prime")

  def exec do
    n = IO.gets("") |> String.trim |> String.to_integer
    l = for _ <- 1..n, do: IO.gets("") |> String.trim |> String.to_integer
    l
      |> Enum.map(fn x -> is_prime(x) |> output end)
  end
end

