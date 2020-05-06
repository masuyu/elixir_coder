defmodule ShiftOnly do
  @moduledoc """
  AtCoder's B question.
  """

  @doc """
  ## Examples
      iex> ShiftOnly.do_shift_only([2, 4, 6])
      1

      iex> ShiftOnly.do_shift_only([8, 16, 12])
      2

      iex> ShiftOnly.do_shift_only([8, 24, 40])
      3
  """
  def do_shift_only(l) do
    do_div_by_two(l, 0)
  end
  defp do_div_by_two(l, acc) do
    case Enum.all?(l, &(rem(&1, 2) == 0)) do
      :true -> do_div_by_two(Enum.map(l, &(div(&1, 2))), acc+1)
      _ -> acc
    end
  end

  def exec() do
    # 出題の入力に合わせる、実際は不要。
    n = IO.gets("")
      |> String.trim
    list = IO.gets("")
      |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    do_shift_only(list)
  end
end
