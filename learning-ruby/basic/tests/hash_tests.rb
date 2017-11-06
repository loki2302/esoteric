require 'test/unit'

class HashTests < Test::Unit::TestCase
  def test_can_define_hash
    h = {"name" => "loki2302", "age" => 33}
    assert_equal({"name" => "loki2302", "age" => 33}, h)
    assert_equal(2, h.length)
    assert_equal("loki2302", h["name"])
    assert_equal(33, h["age"])
    assert_equal(true, h.has_key?("name"))
    assert_equal(false, h.has_key?("sex"))
    assert_equal(["name", "age"], h.keys)
    assert_equal(["loki2302", 33], h.values)
  end
end