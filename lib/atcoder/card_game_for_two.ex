defmodule CardGameForTwo do
  @moduledoc """
  AtCoder's B question.
  """

  @doc """
  ## Examples
      iex> CardGameForTwo.do_card_game_for_two(5, [1, 2, 3, 4, 5])
      3

      iex> CardGameForTwo.do_card_game_for_two(10, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
      5
  """
  def do_card_game_for_two(_, card_list) do
    dsc_ls = card_list |> Enum.sort(&(&1 >= &2))
    (dsc_ls |> Enum.take_every(2) |> Enum.sum()) - (dsc_ls |> Enum.drop_every(2) |> Enum.sum())
  end

  def exec() do
    n = IO.gets("") |> String.trim |> String.to_integer
    list = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    do_card_game_for_two(n, list)
  end
end