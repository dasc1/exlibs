defmodule Xmath do

  def sum(xs), do: _sum(xs, 0)
  defp _sum([], tot), do: tot
  defp _sum([a|tail], tot), do: _sum(tail, tot + a)

  def product(xs), do: _product(xs, 1)
  defp _product([], tot), do: tot
  defp _product([a|tail], tot), do: _product(tail, tot * a)

  def factorial(n), do: _factorial(n, 1)
  defp _factorial(0, _), do: 1
  defp _factorial(1, tot), do: tot
  defp _factorial(n, tot), do: _factorial(n-1, tot * n)

  def proper_divisors(1), do: []
  def proper_divisors(n) do
    1..(div(n,2))
    |> Enum.filter(fn x -> rem(n,x) == 0 end)
  end

end
