defmodule XmathTest do
  use ExUnit.Case

  test "sum - basic tests" do
    assert Xmath.sum([1,2,3]) == 6
    assert Xmath.sum([]) == 0
    assert Xmath.sum([-4, -5, 3, -8, -400]) == -414
    assert Xmath.sum([8]) == 8
  end

  test "product - basic tests" do
    assert Xmath.product([3,4,5]) == 60
    assert Xmath.product([48,12,0]) == 0
    assert Xmath.product([-1,-2,-3,-4]) == 24
    assert Xmath.product([]) == 1
    assert Xmath.product([-5]) == -5
  end

  test "factorial - basic tests" do
    assert Xmath.factorial(0) == 1
    assert Xmath.factorial(1) == 1
    assert Xmath.factorial(2) == 2
    assert Xmath.factorial(7) == 5040
  end

  test "proper divisors" do
    assert Xmath.proper_divisors(1) == []
    assert Xmath.proper_divisors(2) == [1]
    assert Xmath.proper_divisors(3) == [1]
    assert Xmath.proper_divisors(4) == [1, 2]
    assert Xmath.proper_divisors(12) == [1, 2, 3, 4, 6]
    assert Xmath.proper_divisors(20) == [1, 2, 4, 5, 10]
    assert Xmath.proper_divisors(21) == [1, 3, 7]
    assert Xmath.proper_divisors(23) == [1]
  end

  test "proper divisors 2" do
    assert Xmath.proper_divisors2(1) == []
    assert Xmath.proper_divisors2(2) == [1]
    assert Xmath.proper_divisors2(3) == [1]
    assert Xmath.proper_divisors2(4) == [1, 2]
    assert Xmath.proper_divisors2(12) == [1, 2, 3, 4, 6]
    assert Xmath.proper_divisors2(20) == [1, 2, 4, 5, 10]
    assert Xmath.proper_divisors2(21) == [1, 3, 7]
    assert Xmath.proper_divisors2(23) == [1]
  end

end
