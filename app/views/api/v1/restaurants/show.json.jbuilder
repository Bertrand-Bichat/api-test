json.extract! @restaurant, :id, :user_id, :name, :address, :description, :food_type
json.comments @restaurant.comments do |comment|
  json.extract! comment, :id, :user_id, :content, :rating
end
