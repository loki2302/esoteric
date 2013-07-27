require "test/unit"

class DummyTests < Test::Unit::TestCase
    def test_can_add_numbers
        assert_equal(3, 1+2)
    end

    def test_can_use_variable
        sum = 1 + 2
        assert_equal(3, sum)
    end

    def test_can_use_function
        def add(a, b)
            a + b            
        end

        assert_equal(3, add(1, 2))
    end

    def test_can_use_class
        person = Person.new("loki2302")
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

