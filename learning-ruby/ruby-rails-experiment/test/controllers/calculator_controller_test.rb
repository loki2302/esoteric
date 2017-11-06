require 'test_helper'

class CalculatorControllerTest < ActionController::TestCase
  test "can add two numbers" do
    get(:add_numbers, {:a => 1, :b => 2})
    assert_response :success
    assert_equal(3, assigns(:result))
    puts
  end
end
