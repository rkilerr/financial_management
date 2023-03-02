require "test_helper"

class OperationTest < ActiveSupport::TestCase
  test "invalid category_id" do
    new_operation = Operation.new(amount: 999, transaction_type: "дохід", odate: Time.new, description: "Some category", category_id: 4)
    assert_not(new_operation.valid?)
  end

  test "valid category_id" do
    new_operation = Operation.new(amount: 999, transaction_type: "дохід", odate: Time.new, description: "Some category", category_id: 1)
    assert_not(new_operation.valid?)
  end

  test "invalid amount" do
    new_operation = Operation.new(amount: -999, transaction_type: "дохід", odate: Time.new, description: "Some category", category_id: 1)
    assert_not(new_operation.valid?)
  end

  test "operation without description" do
    new_operation = Operation.new(amount: -999, transaction_type: "дохід", odate: Time.new, category_id: 1)
    assert_not(new_operation.valid?)
  end

  test "operation without odate" do
    new_operation = Operation.new(amount: -999, transaction_type: "дохід", description: "Some category", category_id: 1)
    assert_not(new_operation.valid?)
  end
end
