require 'test/unit'

class YieldTests < Test::Unit::TestCase
  def test_can_use_yield_to_repeat_something
    count = 0
    repeat(3) do
      count += 1
    end

    assert_equal(3, count)
  end

  def test_can_check_if_block_given
    assert(!is_block_given(1))
    assert(is_block_given(1) do 123 end)
  end
end

def repeat(n)
  n.times do
    yield
  end
end

def is_block_given(x)
  block_given?
end