require "test/unit"

class Classes < Test::Unit::TestCase
  def test_can_handle_method_calls_dynamically
    magic = Magic.new

    assert_equal("saying hello", magic.hello)
    assert_equal(3, magic.add_numbers(1, 2))
    assert_equal("no idea", magic.something_special)
  end

  def test_can_use_magic_calculator
    calculator = MagicCalculator.new

    assert_equal(3, calculator.add_one_and_two)
    assert_equal(0, calculator.mul_zero_by_nine)
    assert_equal(-1, calculator.sub_one_and_two)
    assert_equal(2, calculator.div_eight_by_four)
  end
end

class Magic
  def method_missing(sym, *args, &block)
    if sym == :hello
      return "saying hello"
    elsif sym == :add_numbers
      return __add_numbers(*args)
    else
      return "no idea"
    end
  end

  def respond_to?(sym)
    true
  end

  def __add_numbers(a, b)
    return a + b
  end
end

class MagicCalculator
  def initialize
    @values_by_words = {
        "zero" => 0,
        "one" => 1,
        "two" => 2,
        "three" => 3,
        "four" => 4,
        "five" => 5,
        "six" => 6,
        "seven" => 7,
        "eight" => 8,
        "nine" => 9
    }

    @operations_by_words = {
        "add" => lambda do |a, b| a + b end,
        "sub" => lambda do |a, b| a - b end,
        "mul" => lambda do |a, b| a * b end,
        "div" => lambda do |a, b| a / b end
    }
  end

  def method_missing(sym, *args, &block)
    components = sym.to_s.split('_')
    operation, left, right = components[0], components[1], components[3]

    operation_handler = @operations_by_words[operation]
    left_value = @values_by_words[left]
    right_value = @values_by_words[right]

    operation_handler.call(left_value, right_value)
  end

  def respond_to?
    true
  end
end