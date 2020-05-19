defmodule NestedLogic do
  # first answer
  def calc_fine(actual, expected) do
    cond do
      actual["y"] - expected["y"] >= 1 -> 10000
      actual["y"] - expected["y"] < 0 -> 0
      actual["m"] - expected["m"] >= 1 -> manth_fine(actual["m"], expected["m"])
      actual["d"] - expected["d"] >= 1 -> day_fine(actual["d"], expected["d"])
      true -> 0
    end
  end

  def manth_fine(actual_month, expected_month), do: (actual_month - expected_month) * 500
  def manth_fine(actual_month, expected_month), do: (actual_month - expected_month) * 500

  def day_fine(actual_day, expected_day), do: (actual_day - expected_day) * 15

  def exec do
    a = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    e = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    actual = ["d", "m", "y"] |> Enum.zip(a) |> Map.new()
    expected = ["d", "m", "y"] |> Enum.zip(e) |> Map.new()
    calc_fine(actual, expected) |> IO.puts
  end


  # second answer
  def calc_fine2([_, _, ay], [_, _, ey]) when ay - ey >= 1, do: 10000
  def calc_fine2([_, _, ay], [_, _, ey]) when ay - ey < 0, do: 0
  def calc_fine2([_, am, _], [_, em, _]) when am - em >= 1, do: (am - em) * 500
  def calc_fine2([ad, _, _], [ed, _, _]) when ad - ed >= 1, do: (ad - ed) * 15
  def calc_fine2([_, _, _], [_, _, _]), do: 0

  def exec2 do
    [ad, am, ay] = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    [ed, em, ey] = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)

    calc_fine2([ad, am, ay], [ed, em, ey]) |> IO.puts
  end
end