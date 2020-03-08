defmodule Main do
  @moduledoc """
  Main.
  there is call functions, with Input module.
  """

  @doc """
  calling product
  """
  def product() do
    [a, b] = InputList.get_int()
    Coder.do_product(a, b)
  end

  def plancing_marbles() do
    a = Input.get_str()
    Coder.do_plancing_marbles(a)
  end

  def shift_only() do
    a = InputVar.get_int()
    Coder.do_shift_only(a)
  end
end
