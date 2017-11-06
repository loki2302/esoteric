require 'test/unit'

class LoopsTests < Test::Unit::TestCase
  def test_can_use_for_loop
    x = 0
    for i in 0..5 # [0,5]
      x += i
    end
    assert_equal(15, x)

    x = 0
    for i in 0...5 # [0,4]
      x += i
    end
    assert_equal(10, x)
  end

  def test_can_use_loop_loop
    x = 0
    loop do
      x += 1
      break if x == 3
    end
    assert_equal(3, x)
  end

  def test_can_use_each
    x = 0
    (0..5).each do |i|
      x += i
    end
    assert_equal(15, x)
  end

  def test_can_use_while
    x = 0
    while x != 5
      x += 1
    end
    assert_equal(5, x)
  end
end