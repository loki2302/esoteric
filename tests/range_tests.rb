require 'test/unit'

class RangeTests < Test::Unit::TestCase
  def test_can_create_arrays_from_ranges
    assert_equal([1, 2, 3], (1..3).to_a)

    x = *(1..3)
    assert_equal([1, 2, 3], x)

    assert_equal([1, 2, 3], (1...4).to_a)

    x = *(1...4)
    assert_equal([1, 2, 3], x)

    assert_equal(["a", "b", "c"], ("a".."c").to_a)
  end

  def test_can_iterate_ranges
    x = 0
    (1..3).each do |i|
      x += i
    end

    assert_equal(6, x)
  end
end