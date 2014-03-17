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

  def proper_divisors2(1), do: []
  def proper_divisors2(n) do
    Xprimes.prime_factors(n)
    |> _pd2_generate_factors([1])
    |> Enum.sort(&(&2 < &1)) # reverse
    |> _pd2_tail
    |> Enum.reverse
  end
  defp _pd2_generate_factors([], nums), do: nums
  defp _pd2_generate_factors([{f1,times}|tail], nums) do
    newfacts = 0..times
    |> Enum.map(&(:math.pow(f1, &1)))
    newnums = lc x inlist newfacts, y inlist nums, do: x * y
    _pd2_generate_factors(tail, newnums)
  end
  defp _pd2_tail([_h|tail]), do: tail

end
