require 'test/unit'

class ReflectionTests < Test::Unit::TestCase
  def test_can_get_methods_of_object
    s = 'qwerty'
    methods = s.methods
    assert(methods.include?(:to_i))
    assert(methods.include?(:to_s))
    assert(methods.include?('to_s'.to_sym))
  end
end