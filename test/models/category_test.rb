require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "check invalid name validate" do
    new_category = Category.new(description: "Some description")
    assert_not(new_category.valid?)
  end

  test "check valid name validate" do
    new_category = Category.new(name: "Some category", description: "Some description")
    assert(new_category.valid?)
  end

  test "check the name parameter for uniqueness validation" do
    new_category_invalid = Category.new(name: "1st Category", description: "Some description")
    assert_not(new_category_invalid.valid?)
  end

  test "saving and gathering category" do
    new_category = Category.new(name: "Some category", description: "Some description")
    new_category.save()
    category = Category.find_by(name: "Some category")
    assert_equal("Some description", category.description)
  end
end
