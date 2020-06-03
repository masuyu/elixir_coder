defmodule NiceNumber do
  def make_list(number, result) when number == 2, do: result
  def make_list(number, result), do: make_list(number-1, [number|result])
  def sieve([head|_], number) when rem(number, head) == 0, do: false
  def sieve([_|tail], number), do: sieve(tail, number)
  def sieve([], _), do: true
  def is_prime(number) when rem(number, 2) == 0, do: false
  def is_prime(number), do: make_list(trunc(:math.sqrt(number)), []) |> sieve(number)

  def every_call([_|tail], acc) when tail == [], do: acc
  def every_call([head|tail], acc) when head == 1, do: every_call(tail, acc)
  def every_call([head|tail], acc) do
    ls = [head|tail] |> Enum.map(fn(x) -> head * x end) |> Enum.concat(acc)
    every_call(tail, ls)
  end

  def main do
    i = IO.gets("")
      |> String.trim
      |> String.to_integer
    Stream.iterate(100000, &(&1+1))
      |> Stream.filter(&is_prime/1)
      |> Enum.take(11)
      |> every_call([])
      |> Enum.concat([1])
      |> Enum.sort
      |> Enum.at(i-1)
      |> IO.puts
  end
end