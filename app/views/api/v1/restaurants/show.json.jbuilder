json.extract! @restaurant, :id, :name, :address, :description, :food_type
json.comments @restaurant.comments do |comment|
  json.extract! comment, :id, :content, :rating
end
