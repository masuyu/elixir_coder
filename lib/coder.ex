defmodule Coder do
  @moduledoc """
  Coder is answer of AtCoder's Questions.
  those functions called from Main modules and executed.
  """

  @doc """
  ## Examples
      iex> Coder.do_product(7, 2)
      "Even"

      iex> Coder.do_product(7, 3)
      "Odd"
  """
  def do_product(a, b) when rem(a * b, 2) == 0, do: "Even"
  def do_product(_, _), do: "Odd"

  @doc """
  ## Examples
      iex> Coder.do_plancing_marbles("111")
      3

      iex> Coder.do_plancing_marbles("101")
      2
  """
  def do_plancing_marbles(a) do
    a |> String.codepoints |> Enum.count(fn(x) -> x == "1" end)
  end

  @doc """
  ## Examples
      iex> Coder.do_shift_only([2, 4, 6])
      1

      iex> Coder.do_shift_only([8, 16, 12])
      2

      iex> Coder.do_shift_only([8, 24, 40])
      3
  """
  def do_shift_only(l) do
    do_div_by_two(l, 0)
  end
  defp do_div_by_two(l, r) do
    case Enum.all?(l, &(rem(&1, 2) == 0)) do
      :true -> do_div_by_two(Enum.map(l, &(div(&1, 2))), r+1)
      _ -> r
    end
  end

  @doc """
  ## Examples
      iex> Coder.do_coins(2, 3, 10, 1000)
      5

      iex> Coder.do_coins(50, 20, 20, 15550)
      42
  """
  def do_coins(a, b, c, x) do
    for i <- 0..a,
        j <- 0..b,
        k <- 0..c do
      i * 500 + j * 100 + k * 50
    end
    |> Enum.count(&(&1 == x))
  end

  @doc """
  ## Examples
      iex> Coder.do_some_sums(10, 1, 3)
      16

      iex> Coder.do_some_sums(20, 8, 10)
      71

      iex> Coder.do_some_sums(100,4,16)
      4554
  """
  def do_some_sums(n, min, max) do
    1..n
    |> Enum.filter(&(min <= do_digits_sum(&1) and do_digits_sum(&1) <= max))
    |> Enum.sum()
  end
  defp do_digits_sum(a) do
    a |> Integer.digits() |> Enum.sum()
  end

  @doc """
  ## Examples
      iex> Coder.do_card_game_for_two(5, [1, 2, 3, 4, 5])
      3

      iex> Coder.do_card_game_for_two(10, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
      5
  """
  def do_card_game_for_two(_, card_list) do
    dsc_ls = card_list |> Enum.sort(&(&1 >= &2))
    (dsc_ls |> Enum.take_every(2) |> Enum.sum()) - (dsc_ls |> Enum.drop_every(2) |> Enum.sum())
  end


  @doc """
  ## Examples
      iex> Coder.do_kagami_mochi([10, 11, 3, 4, 5])
      5

      iex> Coder.do_kagami_mochi([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
      10
  """
  def do_kagami_mochi(l) do
    l |> Enum.uniq() |> length()
  end

  @doc """
  ## Examples
      iex> Coder.do_otoshidama(10, 80000)
      "6 4 0"

      iex> Coder.do_otoshidama(20, 89000)
      "1 15 4"
  """
  def do_otoshidama(n, yen) do
    for i <- 0..n,
        j <- 0..(n - i) do
      {i, j, n-i-j}
    end
    |> Enum.filter(fn {i, j, k} -> i*10000 + j*5000 + k*1000 == yen end)
    |> Enum.at(0, {-1, -1, -1})
    |> case do
      {a, b, c} -> "#{a} #{b} #{c}"
    end
  end

  @doc """
  ## Examples
      iex> Coder.do_daydream("dreamdreamer")
      :YES

      iex> Coder.do_daydream("hogedream")
      :NO
  """
  def do_daydream(s) do
    cond do
      Regex.match?(~r/dream$/, s) -> do_daydream(String.slice(s, 0..-6))
      Regex.match?(~r/dreamer$/, s) -> do_daydream(String.slice(s, 0..-8))
      Regex.match?(~r/erase$/, s) -> do_daydream(String.slice(s, 0..-6))
      Regex.match?(~r/eraser$/, s) -> do_daydream(String.slice(s, 0..-7))
      s == "" -> :YES
      :true -> :NO
    end
  end

  @doc """
  ## Examples
      iex> Coder.do_traveling([[1, 1, 0], [5, 2, 1], [10, 2, 6]])
      :Yes

      iex> Coder.do_traveling([[100,100,0], [102,0,0]])
      :No
  """
  def do_traveling(l) do
    Enum.map_reduce(l, [0, 0, 0], fn [t2, x2, y2], [t1, x1, y1] ->
      {[t2 - t1, abs(x2 - x1) + abs(y2 - y1)], [t2, x2, y2]}
    end)
    |> elem(0)
    |> Enum.all?(fn [dt, dist] -> dt >= dist and rem(dist, 2) == rem(dt, 2) end)
    |> case do
      true -> :Yes
      _ -> :No
    end
  end

  @doc """
  ## Examples
      iex> Coder.do_sock_merchant([1, 2, 1, 2, 1, 2, 3])
      2

      iex> Coder.do_sock_merchant([10, 20, 10, 10, 30, 20, 30])
      3
  """
  def do_sock_merchant(l) do
    l |> Enum.sort(&(&1 < &2)) |> rec_pair([])
  end
  defp rec_pair([], r), do: r |> Enum.count
  defp rec_pair([head|tail], r) do
    case Enum.member?(tail, head) do
      :false -> rec_pair(tail, r)
      :true -> rec_pair(
        tl(tail),
        [{head, hd(tail)} | r]
      )
    end
  end

  @doc """
  ## Examples
      iex> Coder.do_jumping_on_the_clouds([0, 0, 1, 0, 0, 1, 0])
      4

      iex> Coder.do_jumping_on_the_clouds([0, 0, 0, 0, 0])
      2

      iex> Coder.do_jumping_on_the_clouds([0, 1, 1, 0, 0])
      :false

      iex> Coder.do_jumping_on_the_clouds([1, 0, 0, 0, 0])
      :false

      iex> Coder.do_jumping_on_the_clouds([0, 0, 0, 0, 1])
      :false

      iex> Coder.do_jumping_on_the_clouds([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
      5

      iex> Coder.do_jumping_on_the_clouds([0, 0, 0, 1, 0, 0])
      3
  """
  def do_jumping_on_the_clouds([head|tail]) do
    case head do
      0 -> do_count(tail, 0, 0, 0)
      1 -> :false
    end
  end
  defp do_count([head|tail], c, t, d) when d == 1 do
    case head do
      0 -> do_count(tail, c+1, 0, 0)
      1 -> :false
    end
  end
  defp do_count([head|tail], c, t, d) when t == 2 do
    case head do
      0 -> do_count(tail, c, 1, 0)
      1 -> do_count(tail, c-1, 0, d+1)
    end
  end
  defp do_count([head|tail], c, t, d) do
    case head do
      0 -> do_count(tail, c+1, t+1, 0)
      1 -> do_count(tail, c, 0, d+1)
    end
  end
  defp do_count([], _, _, d) when d == 1, do: :false
  defp do_count([], c, t, _) when t == 2, do: c-1
  defp do_count([], c, _, _), do: c

  @doc """
  ## Examples
      iex> Coder.do_repeated_string("aba", 10)
      7

      iex> Coder.do_repeated_string("a", 1000000000000)
      1000000000000
  """
  def do_repeated_string(s, n) do
    count_quotient(s, n) + count_rem(s, n)
  end
  defp count_quotient(s, n), do: s |> String.codepoints |> Enum.filter(&(&1 == "a")) |> Enum.count |> cal_repeated_string1(div(n, String.length(s)))
  defp cal_repeated_string1(a_count, quotient), do: a_count * quotient
  defp count_rem(s, n), do: s |> String.codepoints |> cal_repeated_string2(rem(n, String.length(s)))
  defp cal_repeated_string2(ls, remainder) when remainder > 0, do: ls |> Enum.slice(0, remainder) |> Enum.filter(&(&1 == "a")) |> Enum.count
  defp cal_repeated_string2(_, _), do: 0

  def do_loops(i) do
    1..10 |> Enum.map(&(IO.puts("#{i} x #{&1} = #{i * &1}")))
  end

  def do_lets_review(s) do
    IO.puts("#{s |> String.codepoints |> Enum.take_every(2) |> Enum.join("")} #{s |> String.codepoints |> Enum.drop_every(2) |> Enum.join("")}")
  end

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

  def do_resursion3(i) do
    factorial(i, 1)
  end

  def factorial(0, acc) do
    IO.puts(acc)
  end

  def factorial(i, acc) do
    factorial(i-1, acc*i)
  end
end
