require 'test/unit'

class ArrayTests < Test::Unit::TestCase
  def test_can_define_array
    a = [1, 2, 3]
    assert_equal([1, 2, 3], a)
  end

  def test_can_get_array_length
    a = [1, 2, 3]
    assert_equal(3, a.length)
  end

  def test_can_check_if_array_is_empty
    a = []
    assert_equal(true, a.empty?) # how do I use assert_true?
  end

  def test_can_reverse_array
    a = [1, 2, 3]

    reversed_a = a.reverse
    assert_equal([3, 2, 1], reversed_a)
    assert_equal([1, 2, 3], a)

    a.reverse!
    assert_equal([3, 2, 1], a)
  end

  def test_can_get_array_item
    a = [1, 2, 3]
    assert_equal(2, a[1])
  end

  def test_can_append_array_item
    a = [1, 2, 3]
    assert_equal(3, a.length)

    a += [4]
    assert_equal(4, a.length)
    assert_equal(4, a[3])

    a.push(5)
    assert_equal(5, a.length)
    assert_equal(5, a[4])
  end

  def test_can_get_array_item_index
    a = [1, 2, 3]

    index = a.find_index(2)
    assert_equal(1, index)

    index = a.find_index(333)
    assert_nil(index)
  end

  def test_can_check_if_item_is_in_array
    a = [1, 2, 3]
    assert(a.include?(2))
    assert(!a.include?(2302))
  end

  def test_can_map_array
    a = [1, 2, 3]
    b = a.map { |item| item * 2 }
    assert_equal([2, 4, 6], b)
    assert_equal([1, 2, 3], a)
  end

  def test_can_map_array_inplace
    a = [1, 2, 3]
    a.map! { |item| item * 2 }
    assert_equal([2, 4, 6], a)
  end

  def test_can_remove_item_by_index
    a = [1, 2, 3]
    a.delete_at(1)
    assert_equal([1, 3], a)
  end

  def test_can_remove_item_by_value
    a = [1, 2, 3, 2]
    a_without_two = a.reject { |item| item == 2 }
    assert_equal([1, 3], a_without_two)
  end
end