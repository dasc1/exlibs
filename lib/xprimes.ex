defmodule Xprimes do

  def primes_to(n), do: 2..n |> Enum.to_list |> _primes_to([])
  defp _primes_to([], primes), do: Enum.reverse(primes)
  defp _primes_to([head|tail], primes) do
    newtail = tail |> Enum.filter(fn x -> rem(x,head) != 0 end)
    _primes_to(newtail, [head|primes])
  end

end # defmodule Xprimes
