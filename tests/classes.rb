require "test/unit"

class Classes < Test::Unit::TestCase
  def test_can_use_class
    person = Person.new("loki2302")
    assert_equal(Person, person.class)
    assert_equal("loki2302", person.get_name)

    person = Person.new()
    assert_nil(person.get_name)

    person.set_name("loki2302")
    assert_equal("loki2302", person.get_name)
  end
end

class Person
  def initialize(name = nil)
    @name = name
  end

  def set_name(name)
    @name = name
  end

  def get_name
    @name
  end
end

