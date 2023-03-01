class RemoveTypeFromOperation < ActiveRecord::Migration[7.0]
  def change
    remove_column :operations, :type, :string
  end
end
