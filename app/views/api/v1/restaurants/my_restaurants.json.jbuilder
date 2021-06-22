json.array! @restaurants do |restaurant|
  json.extract! restaurant, :id, :user_id, :name, :address, :description, :food_type
end
