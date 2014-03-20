defmodule Xmath do

  @moduledoc """
  A module of useful math related functions.
  """

  @doc """
  Returns the sum of a collection (if the type supports the '+' operator).

  ## Examples

      iex> Xmath.sum [1,2,3,4,5]
      15

      iex> Xmath.sum [-4]
      -4

      iex> Xmath.sum []
      0

  """
  def sum(xs), do: _sum(xs, 0)
  defp _sum([], tot), do: tot
  defp _sum([a|tail], tot), do: _sum(tail, tot + a)

  @doc """
  Returns the product of a collection (if the type supports the '*' operator).

  ## Examples

      iex> Xmath.product [1,2,3,4,5]
      120

      iex> Xmath.product [-2]
      -2

      iex> Xmath.product [-3, -4]
      12

      iex> Xmath.product []
      1

  """
  def product(xs), do: _product(xs, 1)
  defp _product([], tot), do: tot
  defp _product([a|tail], tot), do: _product(tail, tot * a)

  @doc """
  Computes the factorial !n of a number, i.e. n * (n-1) * (n-2) * ... * 2 * 1

  ## Examples

      iex> Xmath.factorial 5
      120

      iex> Xmath.factorial 2
      2

      iex> Xmath.factorial 1
      1

      iex> Xmath.factorial 0
      1

  """
  def factorial(n), do: _factorial(n, 1)
  defp _factorial(0, _), do: 1
  defp _factorial(1, tot), do: tot
  defp _factorial(n, tot), do: _factorial(n-1, tot * n)

  @doc """
  Returns a list of all proper divisors of the given number (i.e. all
  divisors other than itself)

  Currently maps to proper_divisors2/1

  ## Examples

      iex> Xmath.proper_divisors 12
      [1,2,3,4,6]

      iex> Xmath.proper_divisors 5
      [1]

      iex> Xmath.proper_divisors 1
      []

  """
  def proper_divisors(x), do: proper_divisors2(x)

  @doc """
  Algorithm 1 - tests all divisors less than or equal to n/2
  """
  def proper_divisors1(1), do: []
  def proper_divisors1(n) do
    1..(div(n,2))
    |> Enum.filter(fn x -> rem(n,x) == 0 end)
  end

  @doc """
  Algorithm 2 - constructs divisors by combinations of prime factors
  """
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
    |> Enum.map(&(_pd2_pow(f1, &1)))
    newnums = lc x inlist newfacts, y inlist nums, do: x * y
    _pd2_generate_factors(tail, newnums)
  end
  defp _pd2_tail([_h|tail]), do: tail
  defp _pd2_pow(n, 0), do: 1
  defp _pd2_pow(n, 1), do: n
  defp _pd2_pow(n, x), do: n * _pd2_pow(n, x-1)

end
