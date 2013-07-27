require "test/unit"

class Functions < Test::Unit::TestCase
  def test_can_use_function
    def add_numbers(a, b)
      a + b
    end

    sum = add_numbers(1, 2)
    assert_equal(3, sum)
  end

  def test_can_use_proc
    add_numbers = Proc.new { |x, y| x + y }
    sum = add_numbers.call(1, 2)
    assert_equal(3, sum)
  end

  def test_can_use_lambda
    add_numbers = lambda { |x, y| x + y}
    sum = add_numbers.call(1, 2)
    assert_equal(3, sum)
  end
end