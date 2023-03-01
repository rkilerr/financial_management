class Operation < ApplicationRecord
  paginates_per 15

  belongs_to :category

  validates :amount, numericality: { only_integer: true, greater_than: 0 }
  validates :odate, :description, presence: true

  scope :odate_filter, ->(start_date, end_date) { where("odate BETWEEN ? AND ?", start_date, end_date) }
  scope :transaction_type_filter, ->(transaction_type) { where(transaction_type: transaction_type) }
end
