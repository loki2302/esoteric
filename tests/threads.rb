require "test/unit"

class ThreadsTest < Test::Unit::TestCase
  def test_threads
    x = []
    t = Thread.new do      
      x << 123
    end
    t.join
    assert_equal(1, x.count)
    assert_equal(123, x[0])
  end

  def test_can_return_value_from_thread
    t = Thread.new do
      sleep 0.2
      123
    end

    assert_equal(123, t.value)
  end
end