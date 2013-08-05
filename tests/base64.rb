require "test/unit"
require "base64"

class Base64Test < Test::Unit::TestCase
  def test_base_64
    s = Base64.encode64("loki2302")
    assert_equal("loki2302", Base64.decode64(s))
  end
end