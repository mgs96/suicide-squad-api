class Product < ApplicationRecord
  belongs_to :user
  
  has_many :tags
  has_many :products, through: :tags
end
