class Product < ApplicationRecord
  belongs_to :user
  
  has_many :tags, dependent: :destroy
  has_many :categories, through: :tags
  
  has_many :comments, dependent: :destroy
  
  def self.by_category(category = "")
    self.joins(:categories).where('categories.name': category)
  end
end
