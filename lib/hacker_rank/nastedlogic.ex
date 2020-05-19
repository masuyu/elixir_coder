defmodule NestedLogic do
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
end