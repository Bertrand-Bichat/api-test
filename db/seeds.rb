require 'faker'


puts 'cleaning database'


Comment.destroy_all
Restaurant.destroy_all


puts 'generating restaurants and their comments'



(1..10).each do |id|

  restaurant = Restaurant.create({
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    food_type: Faker::Restaurant.type,
    description: Faker::Restaurant.description
  })

  (1..5).each do |id|
    Comment.create({
      restaurant_id: restaurant.id,
      content: Faker::Restaurant.review,
      rating: Faker::Number.between(from: 1, to: 5)
    })
  end

end


puts "Done!"
