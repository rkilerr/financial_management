require "test_helper"

class OperationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operation = operations(:one)
  end

  test "should get new" do
    get new_operation_url
    assert_response :success
  end

  test "should get edit" do
    get edit_operation_url(@operation)
    assert_response :success
  end

  test "should destroy operation" do
    assert_difference("Operation.count", -1) do
      delete operation_url(@operation)
    end

    assert_redirected_to operations_url
  end
end
