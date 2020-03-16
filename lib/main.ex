defmodule Main do
  @moduledoc """
  Main.
  there is call functions, with Input module.
  """

  @doc """
  calling product
  """
  def product() do
    [a, b] = SI.lst(:int)
    Coder.do_product(a, b)
  end

  def plancing_marbles() do
    a = SI.val(:str)
    Coder.do_plancing_marbles(a)
  end

  def shift_only() do
    n = SI.val(:int)
    a = SI.lst(:int)
    Coder.do_shift_only(a)
  end

  def coins() do
    a = SI.val(:int)
    b = SI.val(:int)
    c = SI.val(:int)
    x = SI.val(:int)
    Coder.do_coins(a, b, c, x)
  end

  def some_sums() do
    n = SI.val(:int)
    a = SI.val(:int)
    b = SI.val(:int)
    Coder.do_some_sums(n, a, b)
  end

  def card_game_for_two() do
    n = SI.val(:int)
    l = SI.lst(:int)
    Coder.do_card_game_for_two(n, l)
  end

  def kagami_mochi() do
    l = SI.by_iter(:int)
    Coder.do_kagami_mochi(l)
  end

  def otoshidama() do
    [n, yen] = SI.lst(:int)
    Coder.do_otoshidama(n, yen)
  end

  def daydream() do
    s = SI.val(:str)
    Coder.do_daydream(s)
  end

  def traveling() do
    l = SI.multi(:int)
    Coder.do_traveling(l)
  end

  def sock_merchant() do
    n = IO.read(:stdio, :line) |> String.trim |> String.to_integer
    l = IO.read(:stdio, :line) |> String.split |> Enum.map(&String.to_integer/1)
    case n == Enum.count(l) do
      :true -> Coder.do_sock_merchant(l)
      :false -> :false
    end
  end

  def jumping_on_the_clouds() do
    n = IO.read(:stdio, :line) |> String.trim |> String.to_integer
    l = IO.read(:stdio, :line) |> String.split |> Enum.map(&String.to_integer/1)
    case n == Enum.count(l) do
      :true -> Coder.do_jumping_on_the_clouds(l)
      :false -> :false
    end
  end

  def repeated_string() do
    s = IO.read(:stdio, :line) |> String.trim
    n = IO.read(:stdio, :line) |> String.trim |> String.to_integer
    Coder.do_repeated_string(s, n)
  end
end
