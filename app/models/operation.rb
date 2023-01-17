class Operation < ApplicationRecord
  belongs_to :category

  validates :amount, numericality: { only_integer: true, greater_than: 0 }
  validates :odate, :description, presence: true
end
