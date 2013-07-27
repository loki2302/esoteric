require "test/unit"

class Functions < Test::Unit::TestCase
  def test_can_use_function
    def add_numbers(a, b)
      a + b
    end

    sum = add_numbers(1, 2)
    assert_equal(3, sum)
  end

  def test_can_use_proc
    add_numbers = Proc.new { |x, y| x + y }
    sum = add_numbers.call(1, 2)
    assert_equal(3, sum)
  end

  def test_can_use_lambda
    add_numbers = lambda { |x, y| x + y}
    sum = add_numbers.call(1, 2)
    assert_equal(3, sum)
  end

  def test_can_accept_lambda
    def add_numbers_magic(a, b, &post_process)
      sum = a + b
      post_process.call(sum)
    end

    result = add_numbers_magic(1, 2) { |x| 2 * x }
    assert_equal(6, result)
  end

  def test_can_use_array_as_list_of_arguments
    def add_numbers(a, b)
      a + b
    end

    args = [1, 2]
    sum = add_numbers(*args)
    assert_equal(3, sum)
  end

  def test_can_have_varargs
    def add_numbers(first_number, *rest)
      rest.reduce(first_number) { |result, item| result += item }
    end

    assert_equal(1, add_numbers(1))
    assert_equal(3, add_numbers(1, 2))
    assert_equal(6, add_numbers(1, 2, 3))
  end

  def test_can_have_named_args
    def make_sentence(args = {})
      first = args[:first] || "default first"
      second = args[:second] || "default second"
      first + second
    end

    assert_equal("default firstdefault second", make_sentence())
    assert_equal("adefault second", make_sentence(:first => "a"))
    assert_equal("default firstb", make_sentence(:second => "b"))
    assert_equal("ab", make_sentence(:first => "a", :second => "b"))
  end
end