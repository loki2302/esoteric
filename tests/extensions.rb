require 'test/unit'

class Extensions < Test::Unit::TestCase
  def test_can_extend_standard_types
    assert_equal(3, 1.plus(2))
    assert_equal("loki2302!!!", "loki2302".emphasize)
  end
end

class Fixnum
  def plus(n)
    return self + n
  end
end

class String
  def emphasize
    return self + "!!!"
  end
end