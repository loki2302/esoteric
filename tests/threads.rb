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
end