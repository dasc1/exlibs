defmodule Xmath do

  def sum(xs), do: _sum(xs, 0)
  defp _sum([], tot), do: tot
  defp _sum([a|tail], tot), do: _sum(tail, tot + a)

  def product(xs), do: _product(xs, 1)
  defp _product([], tot), do: tot
  defp _product([a|tail], tot), do: _product(tail, tot * a)

  def factorial(n), do: _factorial(n, 1)
  def _factorial(0, _), do: 1
  def _factorial(1, tot), do: tot
  def _factorial(n, tot), do: _factorial(n-1, tot * n)

end
