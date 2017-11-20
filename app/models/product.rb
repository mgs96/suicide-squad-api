class Product < ApplicationRecord
  belongs_to :user
  
  has_many :tags
  has_many :categories, through: :tags
  
  def by_category(category = "")
    Product.joins(:categories).where('categories.name': category)
  end
end
