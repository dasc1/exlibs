defmodule XprimesTest do
  use ExUnit.Case

  test "primes_to" do
    assert Xprimes.primes_to(2) == [2]
    assert Xprimes.primes_to(10) == [2,3,5,7]
    assert Xprimes.primes_to(40) == [2,3,5,7,11,13,17,19,23,29,31,37]
  end

  test "prime_factors" do
    assert Xprimes.prime_factors(1) == []
    assert Xprimes.prime_factors(2) == [{2,1}]
    assert Xprimes.prime_factors(3) == [{3,1}]
    assert Xprimes.prime_factors(4) == [{2,2}]
    assert Xprimes.prime_factors(6) == [{2,1}, {3,1}]
    assert Xprimes.prime_factors(12) == [{2,2}, {3,1}]
    assert Xprimes.prime_factors(145656) == 
      [{2,3}, {3,2}, {7, 1}, {17, 2}]
  end

end
