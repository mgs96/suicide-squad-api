json.array! @products do |product|
  json.id product.id
  json.name product.name
  json.desc product.desc
  json.rating product.rating
  json.image product.image
  json.created_at product.created_at
  json.updated_at product.updated_at
  json.user_id product.user_id
  json.categories product.categories
end