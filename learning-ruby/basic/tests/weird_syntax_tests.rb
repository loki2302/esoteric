require 'test/unit'

class WeirdSyntaxTests < Test::Unit::TestCase
  def test_can_use_weird_array_literals
    a = %w(foo bar xxx)
    assert_equal(['foo', 'bar', 'xxx'], a)

    a = %W(foo bar xxx)
    assert_equal(['foo', 'bar', 'xxx'], a)

    a = %w(a\nb)
    assert_equal("a\\nb", a.first)
    assert_equal('a\nb', a.first)

    a = %W(a\nb)
    assert_equal("a\nb", a.first)

    x = 2302

    a = %w(loki#{x} another_loki#{x})
    assert_equal('loki#{x}', a.first)

    a = %W(loki#{x} another_loki#{x})
    assert_equal('loki2302', a.first)
  end

  def test_can_use_weird_syntax_for_string_literals
    assert_equal('hello there', %q(hello there))
    assert_equal('hello there', %Q(hello there))

    x = 2302
    assert_equal('loki#{x}', %q(loki#{x}))
    assert_equal('loki2302', %Q(loki#{x}))

    assert_equal(
        "loki\n#\{x\}",
        %q(loki
#{x}))

    assert_equal(
        "loki\n2302",
        %Q(loki
#{x}))
  end
end