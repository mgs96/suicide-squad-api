json.array! @users do |user|
  json.admin user.admin
  json.id user.id
  json.uid user.uid
  json.name user.name
  json.email user.email
  json.created_at user.created_at
  json.updated_at user.updated_at
  json.last_sign_in_at user.last_sign_in_at
end