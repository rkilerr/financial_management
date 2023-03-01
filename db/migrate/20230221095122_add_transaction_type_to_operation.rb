class AddTransactionTypeToOperation < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :transaction_type, :string
  end
end
