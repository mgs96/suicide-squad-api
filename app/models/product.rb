class Product < ApplicationRecord
  belongs_to :user
  
  has_many :tags
  has_many :categories, through: :tags
end
