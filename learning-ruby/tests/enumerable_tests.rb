require 'test/unit'

class EnumerableTests < Test::Unit::TestCase
  def test_can_check_if_all_items_are_something
    a = [1, 2, 3]

    all_are_greater_than_zero = a.all? { |item| item > 0 }
    assert_equal(true, all_are_greater_than_zero)

    all_are_greater_then_one = a.all? { |item| item > 1 }
    assert_equal(false, all_are_greater_then_one )
  end

  def test_can_check_at_least_one_item_is_something
    a = [1, 2, 3]

    at_least_one_is_greater_than_two = a.any? { |item| item > 2 }
    assert_equal(true, at_least_one_is_greater_than_two)

    at_least_one_is_greater_than_four = a.any? { |item| item > 4 }
    assert_equal(false, at_least_one_is_greater_than_four)
  end

  def test_can_reduce
    a = [1, 2, 3]
    sum = a.reduce(0) { |result, item| result += item }
    assert_equal(6, sum)
  end

  def test_can_sort
    a = [3, 1, 2]

    sorted_a = a.sort
    assert_equal([1, 2, 3], sorted_a)

    sorted_a = a.sort { |x, y| x <=> y }
    assert_equal([1, 2, 3], sorted_a)

    sorted_a = a.sort { |x, y| y <=> x }
    assert_equal([3, 2, 1], sorted_a)
  end
end