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

  def test_can_use_static_members
    counter1 = Counter.new
    counter2 = Counter.new
    assert_equal(0, Counter.get_class_count)
    assert_equal(0, Counter::get_class_count)
    assert_equal(0, counter1.get_instance_count)
    assert_equal(0, counter2.get_instance_count)

    counter1.tick
    assert_equal(1, Counter.get_class_count)
    assert_equal(1, Counter::get_class_count)
    assert_equal(1, counter1.get_instance_count)
    assert_equal(0, counter2.get_instance_count)

    counter2.tick
    assert_equal(2, Counter.get_class_count)
    assert_equal(2, Counter::get_class_count)
    assert_equal(1, counter1.get_instance_count)
    assert_equal(1, counter2.get_instance_count)
  end

  def test_can_use_hand_made_properties
    person = PersonWithHandMadeProperty.new
    assert_equal(nil, person.name)

    person.name = 'loki2302'
    assert_equal('loki2302', person.name)
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

class Counter
  @@class_count = 0

  def initialize
    @instance_count = 0
  end

  def tick
    @@class_count += 1
    @instance_count += 1
  end

  def self.get_class_count
    @@class_count
  end

  def get_instance_count
    @instance_count
  end
end

class PersonWithHandMadeProperty
  def name=(name)
    @name = name
  end

  def name
    @name
  end
end