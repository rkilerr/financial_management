class Category < ApplicationRecord
  has_many :operations, :dependent => :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true

  def self.search(search)
    if search
      self.where('name LIKE :name', name: "%#{search}%")
    else
      @categories = Category.all
    end
  end
end
