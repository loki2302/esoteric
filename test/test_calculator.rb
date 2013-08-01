require "test/unit"
require "calculator"

class CalculatorTest < Test::Unit::TestCase
    def test_add
	calculator = Calculator.new
	result = calculator.add(1, 2)
	assert_equal(3, result)
    end

    def test_add_json
	calculator = Calculator.new
	result = calculator.add_json(1, 2)
	assert_equal("{\"result\":3}", result)
    end
end