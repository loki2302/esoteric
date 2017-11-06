require 'test/unit'

class ModuleTests < Test::Unit::TestCase
  def test_can_use_modules_in_classes
    x = TheClass.new
    assert_equal(234, x.func)
  end
end

module MagicA
  def do_magic_a
    123
  end
end

module MagicB
  def do_magic_b
    111
  end
end

class TheClass
  include MagicA
  include MagicB

  def func
    do_magic_a + do_magic_b
  end
end