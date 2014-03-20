defmodule Xprimes do

  @moduledoc """
  An assortment of functions for generating and manipulating prime numbers
  """

  @doc """
  Generate a list of all primes greater to or less than the provided argument.

  ## Examples

      iex> Xprimes.primes_to 30
      [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

      iex> Xprimes.primes_to 1
      []
    
  """
  def primes_to(n) when n < 2, do: []
  def primes_to(n), do: 2..n |> Enum.to_list |> _primes_to([])
  defp _primes_to([], primes), do: Enum.reverse(primes)
  defp _primes_to([head|tail], primes) do
    newtail = tail |> Enum.filter(fn x -> rem(x,head) != 0 end)
    _primes_to(newtail, [head|primes])
  end

  @doc """
  Decompose a number into its prime factors.

  The result is a list of tuples, each tuple containing a prime factor
  and the number of times it is used.

  ## Examples

      iex> Xprimes.prime_factors 50
      [{2,1}, {5,2}]

      iex> Xprimes.prime_factors 13
      [{13,1}]

      iex> Xprimes.prime_factors 1
      []

  """
  def prime_factors(1), do: []
  def prime_factors(n) do
    possible_primes = n
    |> :math.sqrt
    |> Float.floor
    |> primes_to
    _prime_factors possible_primes, n, []
  end
  defp _prime_factors(_ps, 1, pfactors), do: Xutils.tally pfactors
  defp _prime_factors([], n, pfactors),
    do: _prime_factors([], 1, [n|pfactors])
  defp _prime_factors(xs = [h|_tail], n, pfactors) when rem(n, h) == 0 do
    _prime_factors xs, div(n,h), [h|pfactors]
  end
  defp _prime_factors([_h|tail], n, pfactors) do
    _prime_factors tail, n, pfactors
  end

end # defmodule Xprimes
