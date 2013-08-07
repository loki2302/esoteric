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

  def test_can_use_class_with_attrs
    person = PersonWithAttrs.new
    person.name = "loki2302"
    assert_equal("loki2302", person.name)
  end

  def test_can_call_method_dynamically
    array = [1, 2, 3]
    assert_equal(3, array.send(:length))

    modified_array = array.send(:push, 123)
    assert_equal([1, 2, 3, 123], modified_array)
  end

  def test_can_use_fancy_constructor
    p = PersonWithConstructor.new
    assert_equal(nil, p.name)
    assert_equal(nil, p.age)

    p = PersonWithConstructor.new(:name => "loki2302", :age => 123)
    assert_equal("loki2302", p.name)
    assert_equal(123, p.age)
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

class PersonWithAttrs
  attr_accessor :name
end

class PersonWithConstructor
  attr_accessor :name
  attr_accessor :age

  def initialize(attrs = {})
    @name = attrs[:name]
    @age = attrs[:age]
  end
end