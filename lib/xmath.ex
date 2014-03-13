defmodule Xmath do

  def sum(xs), do: _sum(xs, 0)
  defp _sum([], tot), do: tot
  defp _sum([a|tail], tot), do: _sum(tail, tot + a)

  def product(xs), do: _product(xs, 1)
  defp _product([], tot), do: tot
  defp _product([a|tail], tot), do: _product(tail, tot * a)

end
