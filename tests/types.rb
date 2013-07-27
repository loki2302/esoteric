require 'test/unit'

class Types < Test::Unit::TestCase
  def test_understand_types
    assert_equal(Fixnum, 123.class)
    assert_equal(String, "loki2302".class)
    assert_equal(Float, 3.14.class)
    assert_equal(Array, [1, 2, 3].class)
    assert_equal(Hash, {}.class)
    assert_equal(NilClass, nil.class)
  end
end