class Product < ApplicationRecord
  belongs_to :user
  
  has_many :tags
  has_many :categories, through: :tags
  
  def self.by_category(category = "")
    self.joins(:categories).where('categories.name': category)
  end
end
