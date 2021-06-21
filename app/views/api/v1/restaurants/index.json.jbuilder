json.array! @restaurants do |restaurant|
  json.extract! restaurant, :id, :name, :address, :description, :food_type
end
