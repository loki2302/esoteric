require 'test/unit'

class Strings < Test::Unit::TestCase
  def test_strings
    x = "loki2302"
    assert_equal("loki2302", x)

    name = "loki2302"
    x = "hi #{name}"
    assert_equal("hi loki2302", x)

    x = sprintf("hi %s%d", "loki", 2302)
    assert_equal("hi loki2302", x)

    x = String(2302)
    assert_equal("2302", x)

    x = "loki" + "2302"
    assert_equal("loki2302", x)

    x = "loki"
    x += "2302"
    assert_equal("loki2302", x)

    x = "loki2302"
    x.chop!
    assert_equal("loki230", x)

    x = "  loki2302  "
    x.strip!
    assert_equal("loki2302", x)

    x = "       "
    x.strip!
    assert_equal("", x)

    assert(!"loki2302".empty?)
    assert("".empty?)

    assert_equal(8, "loki2302".length)
  end

  def difference_between_single_and_double_quotes
    x = 2302
    assert_equal('loki2302', "loki#{x}")
    assert_equal('loki#{x}', 'loki#{x}')

    assert_equal('a\nb', 'a\nb')
    assert_not_equal('a\nb', "a\nb")
  end
end